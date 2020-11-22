<template>
<div>
    <div class="form-group">
        <label>Url</label>
         <input type="text" class="form-control" placeholder="Resim url giriniz" v-model="bolum.data.url">
    </div>
	<div class="form-group">
		  
			<div class="checkbox">
			  <label>
				<input type="checkbox" v-model="bolum.data.goster"> Göster
			  </label>
			</div>

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