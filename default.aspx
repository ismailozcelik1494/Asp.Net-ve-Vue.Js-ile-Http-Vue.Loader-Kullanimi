<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 
    <title>Sayfa Edit</title>

    <link rel="stylesheet" href="https://adminlte.io/themes/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://adminlte.io/themes/AdminLTE/dist/css/AdminLTE.min.css?version=2.4">
    <link rel="stylesheet" href="https://adminlte.io/themes/AdminLTE/dist/css/skins/_all-skins.min.css?version=2.4">
    <link rel="stylesheet" href="https://adminlte.io/css/docs.css?version=2.4">

<!-- Fonts -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
          integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
          crossorigin="anonymous">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.alan-sayfa {
    position: fixed;
    right: 440px;
    top: 10px;
    left: 0;
    bottom: 20px;
    overflow-y: auto;
    overflow-x: hidden;
    padding: 10px;
}
.alan-edit{
    position: fixed;
    right: 30px;
    top: 10px;
    width: 400px;
    bottom: 30px;
    overflow-y: auto;
}
.alan-sayfa .bolum-view {
    min-height: 20px;
    position: relative;
    margin-left: 30px;
}
.alan-sayfa .bolum-view.hover:hover:before {
    content: ' ';
    top: -2px;
    right: -2px;
    bottom: -2px;
    left: -2px;
    border: 1px dashed rgba(0,0,0,0.1);
    position: absolute;
}
 .edit-buttons {
    visibility: hidden;
    position: absolute;
    top: 0;
    z-index: 1000;
    right: 0;
}
.edit-buttons .btn {
    width: 25px;
}
.alan-sayfa .bolum-view:hover .edit-buttons {
    visibility: visible;
}
.sortable-ghost {
    opacity: 0.4;
}

</style>
</head>
<body class="skin-black-light layout-top-nav">
<div class="wrapper">
<div class="content-wrapper" id="app">
        <div class="alan-sayfa">
            <div class="bolum-view sonuc-unwrap">
                    <div class="content-header"><h1>{{sayfa.baslik}}</h1></div>
            </div>
            <draggable :list="sayfa.bolumler" :options="{ahandle:'.move-handle'}" class="sonuc-unwrap">
                <div v-for="bolum in sayfa.bolumler" class="bolum-view hover sonuc-unwrap">
                    <div class="edit-buttons sonuc-remove">
                        <button class="btn btn-warning btn-xs move-handle hide"><i class="fa fa-arrows-v"></i></button>
                        <button @click="editle(bolum)" class="btn btn-success btn-xs"><i class="fa fa-edit"></i></button>
                        <button @click="kaldir(bolum)" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></button>
                    </div>                
                    <component :is="bolum.modul.viewCom" :bolum="bolum"></component>
                </div>
            </draggable>
        </div>
        <div class="alan-edit">
            <div class="box box-solid box-primary">
                <div class="box-header">
                    <h3 class="box-title">Sayfa</h3>
                    <div class="pull-right box-tools">
                        <button class="btn btn-default" @click="kaydet">Kaydet</button>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                Alan ekle <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li v-for="modul in moduller">
                                    <a href="#" @click.prevent="yeniAlanEkle(modul)">{{modul.ad}}</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="box-body">
                    <div class="form-group">
                        <label>Sayfa Başlık</label>
                        <input type="text" class="form-control" placeholder="Başlık Giriniz" v-model="sayfa.baslik">
                    </div>
                </div>
            </div>
            <div class="box box-solid box-primary" v-if="editlenen.modul">
                <div class="box-header"><h3 class="box-title">{{editlenen.modul.ad}} - Düzenle</h3></div>
                <div class="box-body">
                    <component :is="editlenen.modul.editCom" :bolum="editlenen"></component>
                </div>
            </div>
        </div>
</div>
</div>
<!-- Scripts -->
<script src="https://adminlte.io/themes/AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
<script src="https://adminlte.io/themes/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="httpVueLoader.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<script src="Sortable.min.js"></script>
<script src="vuedraggable.min.js"></script>
<script type="text/javascript">

function unwrap(el){
    var parent = el.parentNode; // get the element's parent node
    while (el.firstChild){
        parent.insertBefore(el.firstChild, el); // move all children out of the element
    }
    parent.removeChild(el); // remove the empty element
}
function clone(data){
    return JSON.parse(JSON.stringify(data));
}
var moduller = {
        callout:{
            ad:"Bilgilendirme",
            yeniData:{
                baslik:"Bilgi!",
                metin:"Bilgilendirme",
                class:"callout callout-danger"
            }
        },
        paragraf:{
            ad:"Paragraf",
            yeniData:{
                metin:"Yeni paragraf"
            }
        },
        list:{
            ad:"List",
            yeniData:{
                satirlar:[]
            }
        },
        h3:{
            ad:"Bölüm Başlık - h3",
            editCom:"h-edit",
            yeniData:{
                baslik:null
            }
        },
        h4:{
            ad:"Alt Bölüm Başlık - h4",
            editCom:"h-edit",
            yeniData:{
                baslik:null
            }
        }
		,resim:{
            ad:"Resim Ekle",
            editCom:"resim-edit",
            yeniData:{
                url:"http://www.nigdetb.org.tr/Portals/269/referans/tobb.jpg",
				goster:true
            }
        }
    },
    components = {},
    versiyon=3;

$.each(moduller,function(i,item){
    item.kod = i;
    if(!item.viewCom) item.viewCom = i+"-view";
    if(!item.editCom) item.editCom = i+"-edit";
    if(!components[item.viewCom]) components[item.viewCom] = httpVueLoader('bolum/' + item.viewCom +'.vue?v' + versiyon);
    if(!components[item.editCom]) components[item.editCom] = httpVueLoader('bolum/' + item.editCom +'.vue?v' + versiyon);
});

var sayfa = localStorage.getItem("sayfa_edit");
if(sayfa){
    sayfa = JSON.parse(sayfa);
}else{
    sayfa = {baslik:"Yeni sayfa",bolumler:[]};
}
$.each(sayfa.bolumler,function(i,item){
    item.modul = moduller[item.modul];
});

var veri = {
    editlenen:{},
    moduller:moduller,
    sayfa:sayfa
}; 
var demo = new Vue({
el: '#app',
data:veri,
methods:{
        editle:function(bolum){
            this.editlenen = bolum;
        },
        kaldir:function(bolum){
        this.sayfa.bolumler.splice(this.sayfa.bolumler.indexOf(bolum),1);
            if(this.editlenen==bolum) this.editlenen = {};
        },
        yeniAlanEkle:function(modul){
            var bolum = {
                modul:modul,
                data: clone(modul.yeniData)
            };
            this.sayfa.bolumler.push(bolum);
            this.editlenen = bolum;
        },
        kaydet:function(){
            var $sonuc = $("<div>").html($('.alan-sayfa').html());
            $sonuc.find('.sonuc-remove').remove();
            $sonuc.find('.sonuc-unwrap').each(function(){
                unwrap(this);
            });
            var html = $sonuc.html().replace(/<!---->/g,'');
            
            //console.log(html);
            var sayfa = clone(this.sayfa);
            $.each(sayfa.bolumler,function(){
                this.modul = this.modul.kod;
            });

            //console.log(JSON.stringify(sayfa));
            localStorage.setItem("sayfa_edit",JSON.stringify(sayfa));
        }
    },
    components: components
})
</script>
</body>
</html>
