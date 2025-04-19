<template>
  <div :style="{ fontFamily: resumeStyle.fontFamily, color: resumeStyle.fontColor, backgroundColor: resumeStyle.backgroundColor }">
    <!-- 渲染简历内容 -->
    <h1>{{ resume.name }}</h1>
    <p>{{ resume.job }}</p>
    <!-- 可以添加更多简历内容的渲染 -->
  </div>
</template>

<script>
export default {
  props: {
    resume: {
      type: Object,
      required: true
    },
    resumeStyle: {
      type: Object,
      required: true
    }
  }
};
</script>