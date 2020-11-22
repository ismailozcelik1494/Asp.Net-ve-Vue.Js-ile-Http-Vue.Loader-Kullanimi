<template>
<div class="form-group">
    <label>Başlık</label>
    <input type="text" class="form-control" placeholder="Başlık Giriniz" v-model="bolum.data.baslik">
</div>
</template>

<script>
module.exports = {
    props: {
        bolum: Object
    }
}
</script>