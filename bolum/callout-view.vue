<template>
<div :class="bolum.data.class">
    <h4>{{bolum.data.baslik}}</h4>
    <p v-html="bolum.data.metin"></p>
</div>
</template>
<script>
    module.exports = {
        props: {
            bolum: Object
        }
    }
</script>