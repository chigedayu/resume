<template>
  <div class="a4-container">
    <div class=content-bd>
      <header class="content-right content-hd">

        <section class=title>
          <img class=avator :src="resume.imgUrl">
          <div class="file-container" v-if="mode==='edit'">点击上传头像<input id="file" type="file" @change="$emit('saveImg',$event)" accept="image/*"></div>
          <div class=name>
            <h1 :contenteditable="mode==='edit'" @blur="$emit('changeResume','name',$event)">{{resume.name}}</h1>
          </div>
          <h2 class="job" :contenteditable="mode==='edit'" @blur="$emit('changeResume','job',$event)">{{resume.job}}</h2>
        </section>

        <section class=info>
          <div v-for="(info,i) in resume.infos">
            <h2 :contenteditable="mode==='edit'" @blur="$emit('changeResume','infos['+i+']',$event)">{{info}}</h2>
            <button class="del" v-if="i>2 && mode==='edit'" @click="$emit('deleteItem','infos',i)">×</button>
          </div>

          <button class="add" v-if="mode==='edit'" @click="$emit('addItem','infos')">+</button>
        </section>

        <section class=contact>
          <ul>
            <li v-for="(contact,i) in resume.contacts">
              <a href="javascript:;" target=_blank>
                <i class="iconfont" :class="contact.icon"></i>
                <span class=contact-link :contenteditable="mode==='edit'" @blur="$emit('changeResume','contacts['+i+'].link',$event)">{{contact.link}}</span>
              </a>
              <button class="del" v-if="i>4 && mode==='edit'" @click="$emit('deleteItem','contacts',i)">×</button>
            </li>
            <button class="add" v-if="mode==='edit'" @click="$emit('addItem','contacts')">+</button>
          </ul>
        </section>
      </header>
      <div class=content-left>
        <section class=practice>
          <header class=section-hd>
            <span class=section-title-l></span>
            <h2 class="section-title" :contenteditable="mode==='edit'" @blur="$emit('changeResume','titles[0]',$event)">{{resume.titles[0]}}</h2>
            <span class=section-title-r></span>
          </header>
          <div class=section-bd>
            <div class=item v-for="(practice,i) in resume.practices">
              <header class=item-hd>
                <span class=item-time :contenteditable="mode==='edit'"  @blur="$emit('changeResume','practices['+i+'].time',$event)">{{practice.time}}</span>
                <h3 class=item-name :contenteditable="mode==='edit'"  @blur="$emit('changeResume','practices['+i+'].company',$event)">{{practice.company}}</h3>
                <button class="del" v-if="i>2 && mode==='edit'" @click="$emit('deleteItem','practices',i)">×</button>
              </header>
              <div class=item-bd>
                <p class=section-content :contenteditable="mode==='edit'"  @blur="$emit('changeResume','practices['+i+'].description',$event)">{{practice.description}}</p>
              </div>
            </div>
            <button class="add" v-if="mode==='edit'" @click="$emit('addItem','practices')">+</button>
          </div>
        </section>

        <section class=project>
          <header class=section-hd>
            <span class=section-title-l></span>
            <h2 class="section-title" :contenteditable="mode==='edit'"  @blur="$emit('changeResume','titles[1]',$event)">{{resume.titles[1]}}</h2>
            <span class=section-title-r></span>
          </header>
          <div class=section-bd>
            <div class=item v-for="(project,i) in resume.projects">
              <header class=item-hd>
                <span class=item-time :contenteditable="mode==='edit'"  @blur="$emit('changeResume','projects['+i+'].time',$event)">{{project.time}}</span>
                <a class="btn item-more" :href="project.link" target=_blank >项目链接</a>
                <input class="item-more" type="text" v-model="project.link" title="必须以http或https开头" placeholder="网址必须以http或https开头" v-if="mode==='edit'">
                <h3 class=item-name :contenteditable="mode==='edit'" @blur="$emit('changeResume','projects['+i+'].work',$event)">{{project.art}}</h3>
                <button class="del" v-if="i>2 && mode==='edit'" @click="$emit('deleteItem','projects',i)">×</button>
              </header>
              <div class=item-bd>
                <p class=section-content :contenteditable="mode==='edit'"  @blur="$emit('changeResume','projects['+i+'].description',$event)">{{project.description}}</p>
              </div>
            </div>
            <button class="add" v-if="mode==='edit'" @click="$emit('addItem','projects')">+</button>
          </div>
        </section>

        <section class=skill>
          <header class=section-hd>
            <span class=section-title-l></span>
            <h2 class="section-title" :contenteditable="mode==='edit'" @blur="$emit('changeResume','titles[2]',$event)">{{resume.titles[2]}}</h2>
            <span class=section-title-r></span>
          </header>
          <div class=section-bd>
            <ul class=section-list>
              <li v-for="(skill,i) in resume.skills"><p class=section-content :contenteditable="mode==='edit'" @blur="$emit('changeResume','skills['+i+']',$event)"><i class="iconfont icon-dot"></i>{{skill}}</p><button class="del" v-if="i>2 && mode==='edit'" @click="$emit('deleteItem','skills',i)">×</button></li>
            </ul>
            <button class="add" v-if="mode==='edit'" @click="$emit('addItem','skills')">+</button>
          </div>
        </section>

        <section class=prize>
          <header class=section-hd>
            <span class=section-title-l></span>
            <h2 class="section-title" :contenteditable="mode==='edit'" @blur="$emit('changeResume','titles[3]',$event)">{{resume.titles[3]}}</h2>
            <span class=section-title-r></span>
          </header>
          <div class=section-bd>
            <div class=item v-for="(prize,i) in resume.prizes">
              <header class=item-hd>
                <span class=item-time :contenteditable="mode==='edit'" @blur="$emit('changeResume','prizes['+i+'].time',$event)">{{prize.time}}</span>
                <h3 class=item-name :contenteditable="mode==='edit'" @blur="$emit('changeResume','prizes['+i+'].description',$event)">{{prize.description}}</h3>
                <button class="del" v-if="i>2 && mode==='edit'" @click="$emit('deleteItem','prizes',i)">×</button>
              </header>
            </div>
            <button class="add" v-if="mode==='edit'" @click="$emit('addItem','prizes')">+</button>
          </div>
        </section>
      </div>
    </div>
    <div class="button-container print-hide">
      <el-button @click="downloadResume">下载</el-button>
      <el-button @click="saveResume">保存</el-button>
      <el-button @click="previewResume">预览</el-button>
    </div>
  </div>



</template>

<script>
import axios from "axios";
import jsPDF from "jspdf";
import html2canvas from "html2canvas";
import "../css/style2.css";



export default {
  props: ['mode', 'resume'],
  data() {
    return {
      selectedTemplate: 'default'
    };
  },
  created() {
    // 获取路由中的模板名称
    const template = this.$route.query.template;
    if (template) {
      this.selectedTemplate = template;
    }
  },
  methods: {
    downloadResume() {
      // 使用html2canvas和jsPDF生成PDF并下载
      const element = document.querySelector('.a4-container');
      html2canvas(element, {
        scale: 2,
        logging: false,
        useCORS: true
      }).then(canvas => {
        const imgData = canvas.toDataURL('image/png');
        const pdf = new jsPDF('p', 'mm', 'a4');
        const imgProps = pdf.getImageProperties(imgData);
        const pdfWidth = pdf.internal.pageSize.getWidth();
        const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
        
        pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
        pdf.save('resume.pdf');
      });
    },
    async previewResume() {
      // 使用html2canvas和jsPDF生成PDF预览
      const element = document.querySelector('.a4-container');
      const canvas = await html2canvas(element, {
        scale: 2,
        logging: false,
        useCORS: true
      });
      
      const imgData = canvas.toDataURL('image/png');
      const pdf = new jsPDF('p', 'mm', 'a4');
      const imgProps = pdf.getImageProperties(imgData);
      const pdfWidth = pdf.internal.pageSize.getWidth();
      const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
      
      pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
      const pdfBlob = pdf.output('blob');
      const pdfUrl = URL.createObjectURL(pdfBlob);
      window.open(pdfUrl, '_blank');
    },
    // saveResume() {
    //   console.log('this.resume:', this.resume);
    //   if (this.loading) {
    //     return
    //   }
    //   const template = this.$route.query.template;
    //   const username = localStorage.getItem('username');
    //   const resume=this.resume;
    //   const requestData = {
    //     username,
    //     template: template,
    //     resume: resume,
    //
    //   };
    //   this.loading = true
    //   this.$http.post("/resume/saveResume", requestData)
    //       .then(response => {
    //         // 请求成功处理逻辑
    //         console.log('简历保存成功');
    //         this.loading = false;
    //       })
    //       .catch(error => {
    //         // 请求失败处理逻辑
    //         console.error('简历保存失败', error);
    //         this.loading = false;
    //       });
    //
    //   // 这里可以添加保存简历的逻辑
    //   console.log('保存简历');
    //   this.loading = false
    // }
    saveResume() {
      console.log('this.resume:', this.resume);
      if (this.loading) {
        return;
      }
      
      this.$prompt('请输入简历名称', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        inputPattern: /^[\s\S]{1,50}$/,
        inputErrorMessage: '简历名称不能为空且不超过50个字符'
      }).then(({ value }) => {
        const template = this.$route.query.template;
        const username = localStorage.getItem('username');
        const resume = this.resume;
        const requestData = {
          username,
          template: template,
          resume: resume,
          resumeName: value
        };
        this.loading = true;
        this.$http.post("/resume/saveResume", requestData, {
          headers: {
            'Content-Type': 'application/json'
          }
        })
      }).catch(() => {
        // 用户取消输入
        console.log('用户取消保存');
      });
    }
  }
};
</script>

<style scoped>

</style>