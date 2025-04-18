<template>
  <div id="template-select">
    <div class="template-container">
      <h2>模板选择</h2>
      <div class="button-container">
        <button @click="selectTemplate('default')"  class="template-button">默认模板</button>
        <button @click="selectTemplate('pink')" class="template-button">粉色模板</button>
        <button @click="selectTemplate('blue')" class="template-button">蓝色模板</button>
        <button @click="selectTemplate('gray')" class="template-button">灰色模板</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    selectTemplate(templateName) {
      // 跳转到简历编辑页，并传递所选模板名称
      this.$router.push({ path: '/resume', query: { template: templateName } });
    }
  }
};
</script>

<style scoped>
#template-select {
  width: 100%;
  padding: 20px;
}

.template-container {
  width: 80%;
  max-width: 800px;
  margin: 0 auto;
}

.template-container h2 {
  text-align: center;
  margin-bottom: 20px;
}

.button-container {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.template-button {
  width: 22%;
  margin: 1.5%;
  padding: 10px;
  border: none;
  border-radius: 5px;
  background-color: #f0f0f0;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.template-button:hover {
  background-color: #e0e0e0;
}
</style>