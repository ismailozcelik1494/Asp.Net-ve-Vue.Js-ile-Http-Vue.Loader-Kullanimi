<template>
<ul>
    <li v-for="(satir,index) in bolum.data.satirlar" :key="index" v-html='satir.metin'></li>
    <li v-if="bolum.data.satirlar.length==0">Satır Ekleyiniz</li>
</ul>
</template>
<script>
    module.exports = {
        props: {
            bolum: Object
        }
    }
</script>