<template>
<div>
    <div class="form-group">
        <label>Başlık</label>
        <input type="text" class="form-control" placeholder="Başlık Giriniz" v-model="bolum.data.baslik">
    </div>
    <div class="form-group">
        <label>Bağırma Tipi</label>
        <select class="form-control" v-model="bolum.data.class">
            <option value="callout callout-danger">Tehlike</option>
            <option value="callout callout-info">Bilgi</option>
            <option value="callout callout-warning">Uyarı</option>
            <option value="callout callout-success">Başarı</option>
        </select>
    </div>
    <div class="form-group">
        <label>Metin</label>
        <textarea cols="20" rows="2" class="form-control" style="height: 120px" v-model="bolum.data.metin"></textarea>
    </div>
</div>
</template>

<script>
module.exports = {
    props: {
        bolum: Object
    }
}
</script>