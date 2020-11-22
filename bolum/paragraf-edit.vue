<template>
<div>
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