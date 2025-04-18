<template>
  <div class="history-resumes-container">
    <h2>历史简历</h2>
    <div v-for="resume in historyResumes" :key="resume.id">
      <button @click="loadResume(resume)">{{ resume.resumeName }}</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      historyResumes: []
    };
  },
  created() {
    this.fetchHistoryResumes();
  },
  methods: {
    fetchHistoryResumes() {
      const username = localStorage.getItem('username');
      this.$http.get('/resume/getHistoryResumes', {
        params: {
          username
        }
      })
          .then(response => {
            console.log('获取到的历史简历数据:', response.data); // 打印数据
            this.historyResumes = response.data;
          })
          .catch(error => {
            console.error('获取历史简历失败', error);
          });
    },
    loadResume(resume) {
      const resumeData = JSON.parse(resume.resumeJson);
      const template = resume.resumeName;
      this.$router.push({
        path: '/resume',
        query: {
          template
        }
      });
      // 这里可以将 resumeData 传递给 App.vue 中的 resume 对象
      this.$root.resume = resumeData;
    }
  }
};
</script>

<style scoped>
.history-resumes-container {
  padding: 20px;
}

button {
  margin: 5px;
}
</style>