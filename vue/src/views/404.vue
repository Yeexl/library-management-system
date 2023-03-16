<template lang="">
    <div class="mainBox">
        <div class="headerText">404</div>
        <div class="tipsText">未找到页面</div>
        <div>
            <el-button type="text" class="btn" @click="back">返回主页</el-button>
        </div>
    </div>
</template>
<script>
export default {
    name:'404',
    data() {
        return {
            
        }
    },
    methods: {
        back() {
            this.$router.push('/')
        }
    },
}
</script>
<style scoped>
    .mainBox {
        text-align: center;
    }
    .headerText {
        margin-top: 150px;
        font-size: 100px;
    }
    .tipsText {
        font-size: 50px;
    }
    .btn {
        margin-top: 20px;
        font-size: 20px;
    }
</style>