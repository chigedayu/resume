<template>
  <div class="preview-modal" v-if="visible">
    <div class="preview-content">
      <slot></slot>
    </div>
    <div class="preview-actions">
      <button @click="close">关闭</button>
      <button @click="print">打印</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PreviewModal',
  props: {
    visible: {
      type: Boolean,
      default: false
    }
  },
  methods: {
    close() {
      this.$emit('close');
    },
    print() {
      window.print();
    }
  }
};
</script>

<style scoped>
.preview-modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

.preview-content {
  background-color: white;
  padding: 20px;
  max-width: 800px;
  width: 90%;
  max-height: 90vh;
  overflow-y: auto;
}

.preview-actions {
  margin-top: 20px;
}

.preview-actions button {
  margin: 0 10px;
  padding: 8px 16px;
  background-color: #4CAF50;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.preview-actions button:hover {
  background-color: #45a049;
}

@media print {
  .preview-modal {
    position: static;
    background-color: transparent;
  }
  .preview-actions {
    display: none;
  }
}
</style>