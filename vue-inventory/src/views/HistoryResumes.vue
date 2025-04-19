<template>
  <div class="history-resumes-container">
    <h2 class="history-title">历史简历</h2>
    <el-row :gutter="20">
      <el-col v-for="resume in historyResumes" :key="resume.id" :span="6">
        <el-button 
          type="primary" 
          @click="loadResume(resume)"
          class="resume-button"
        >
          {{ resume.resumeName }}
        </el-button>
      </el-col>
    </el-row>
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
          .then(data => {
            this.historyResumes = data;
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
  margin-top: 60px;
}

.history-title {
  font-size: 28px;
  color: #409EFF;
  margin-bottom: 30px;
  text-align: center;
  font-weight: bold;
}

.resume-button {
  margin-bottom: 15px;
  width: 100%;
  height: 80px;
  border-radius: 0;
  font-size: 18px;
}
</style>