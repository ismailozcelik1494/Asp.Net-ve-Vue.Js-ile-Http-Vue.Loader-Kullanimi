<template>
<img :src="bolum.data.url" v-if="bolum.data.goster">
</template>
<script>
    module.exports = {
        props: {
            bolum: Object
        }
    }
</script>