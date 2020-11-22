<template>
<p v-html="metin"></p>
</template>
<script>
    module.exports = {
        props: {
            bolum: Object
        },
        computed:{
            metin:function(){
                return this.bolum.data.metin != '' ? this.bolum.data.metin:"Metin giriniz";
            }
        }
    }
</script>