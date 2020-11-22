<template>
<h3>{{baslik}}</h3>
</template>
<script>
    module.exports = {
        props: {
            bolum: Object
        },
        computed:{
            baslik:function() {
                return this.bolum.data.baslik && this.bolum.data.baslik != ""?this.bolum.data.baslik:"Başlık giriniz";
            }
        }
    }
</script>