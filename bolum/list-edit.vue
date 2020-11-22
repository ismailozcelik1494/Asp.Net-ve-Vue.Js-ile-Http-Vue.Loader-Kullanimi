<template>
<div>
    <label>Satırlar</label><br/>
    <draggable :list="bolum.data.satirlar" :options="{handle:'.handle'}">
        <div v-for="(satir,index) in bolum.data.satirlar" :key="index" class="input-group input-group-sm" style="margin-bottom:5px">
            <span class="input-group-addon handle"><i class="fa fa-arrows-v"></i></span>
            <input type="text" class="form-control" placeholder="Başlık Giriniz" v-model="satir.metin">
            <span class="input-group-btn">
                <button type="button" class="btn btn-danger btn-flat" @click="kaldir(satir)"><i class="fa fa-trash"></i></button>
            </span>
        </div>
    </draggable>
    <button @click="yeni" class="btn btn-primary">Satır ekle</button>
</div>
</template>

<script>
module.exports = {
    props: {
        bolum: Object
    },methods:{
        yeni:function(){
            this.bolum.data.satirlar.push({metin:"Yeni sayır"});
        },
        kaldir:function(satir){
            this.bolum.data.satirlar.splice(this.bolum.data.satirlar.indexOf(satir),1);
        }
    }
}
</script>