<template>
	<div>
		<div class="login_view">
			<el-form :model="loginForm" class="login_form">
				<div class="title_view">基于农商信息交流平台登录</div>
				<div class="list_item" v-if="loginType==1">
					<div class="list_label">
						账号：
					</div>
					<input class="list_inp" v-model="loginForm.username" placeholder="请输入账号" />
				</div>
				<div class="list_item" v-if="loginType==1">
					<div class="list_label">
						密码：
					</div>
					<input class="list_inp" v-model="loginForm.password" type="password" placeholder="请输入密码" @keydown.enter.native="handleLogin"  />
				</div>
				<div class="list_type" v-if="userList.length>1">
					<div class="list_label">
						用户类型：
					</div>
				  <el-select v-model="loginForm.role" placeholder="请选择用户类型">
				    <el-option v-for="(item,index) in userList" :label="item.roleName" :value="item.roleName"></el-option>
				  </el-select>
				</div>
				<div class="remember_view" v-if="loginType==1">
					<el-checkbox v-model="rememberPassword" label="记住密码" size="large" :true-label="true"
						:false-label="false" />
				</div>
				<div class="btn_view">
					<el-button class="login" v-if="loginType==1" type="success" @click="handleLogin">登录</el-button>
					<el-button class="register" type="primary" @click="handleRegister('nongmin')">注册农民</el-button>
				</div>
			</el-form>
		</div>
		<Vcode :show="isShow" @success="success" @close="close" @fail='fail'></Vcode>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
		onMounted,
	} from "vue";
	const userList = ref([])
	const menus = ref([])
	const loginForm = ref({
		role: '',
		username: '',
		password: ''
	})
	const tableName = ref('')
	const loginType = ref(1)
	//是否记住密码
	const rememberPassword = ref(true)
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	//注册
    const handleRegister = (tableName) => {
    	context?.$router.push(`/${tableName}Register`)
    	
    }
	const handleLogin = () => {
		if (!loginForm.value.username) {
			context?.$toolUtil.message('请输入用户名', 'error')
			
			return;
		}
		if (!loginForm.value.password) {
			context?.$toolUtil.message('请输入密码', 'error')
			
			return;
		}
		if (userList.value.length > 1) {
			if (!loginForm.value.role) {
				context?.$toolUtil.message('请选择角色', 'error')
				verifySlider.value.reset()
				return;
			}
			for (let i = 0; i < menus.value.length; i++) {
				if (menus.value[i].roleName == loginForm.value.role) {
					tableName.value = menus.value[i].tableName;
				}
			}
		} else {
			tableName.value = userList.value[0].tableName;
			loginForm.value.role = userList.value[0].roleName;
		}
		login()
	}
	const login = () => {
		context?.$http({
			url: `${tableName.value}/login?username=${loginForm.value.username}&password=${loginForm.value.password}`,
			method: 'post'
		}).then(res => {
			//是否保存当前账号密码至缓存
			if (rememberPassword.value) {
				let loginForm1 = JSON.parse(JSON.stringify(loginForm.value))
				delete loginForm1.code
				context?.$toolUtil.storageSet("loginForm", JSON.stringify(loginForm1));
			} else {
				context?.$toolUtil.storageRemove("loginForm")
			}
			context?.$toolUtil.storageSet("Token", res.data.token);
			context?.$toolUtil.storageSet("role", loginForm.value.role);
			context?.$toolUtil.storageSet("sessionTable", tableName.value);
			context?.$toolUtil.storageSet("adminName", loginForm.value.username);
			context?.$router.push('/')
		}, err => {
		})
	}
	//获取菜单
	const getMenu=()=> {
      let params = {
        page: 1,
        limit: 1,
        sort: 'id',
      }

      context?.$http({
        url: "menu/list",
        method: "get",
        params: params
      }).then(res => {
          menus.value = JSON.parse(res.data.data.list[0].menujson)
          for (let i = 0; i < menus.value.length; i++) {
            if (menus.value[i].hasBackLogin=='是') {
              userList.value.push(menus.value[i])
            }
          }
			//获取缓存是否有保存的账号密码
			let form = context?.$toolUtil.storageGet('loginForm')
			if (form) {
				
			}else {
				loginForm.value.role = userList.value[0].roleName
			}
          context?.$toolUtil.storageSet("menus", JSON.stringify(menus.value));
      })
    }
	//初始化
	const init = () => {
		getMenu();
		//获取缓存是否有保存的账号密码
		let form = context?.$toolUtil.storageGet('loginForm')
		if (form) {
			loginForm.value = JSON.parse(form)
		}
	}
	onMounted(()=>{
		init()
		
	})
</script>

<style lang="scss" scoped>
	.login_view {
		background-repeat: no-repeat;
		flex-direction: column;
		background-size: 100% 100%!important;
		background: url(http://codegen.caihongy.cn/20230831/206c5946d0df4398889fb00c865fccd6.jpg);
		display: flex;
		min-height: 100vh;
		justify-content: flex-start;
		align-items: flex-start;
		position: relative;
		background-position: center center;
		// 表单盒子
		.login_form {
			border-radius: 4px;
			padding: 0 20px 80px 0;
			margin: 0 auto;
			flex-direction: column;
			background: url(http://codegen.caihongy.cn/20230811/35998be3b95844a68cab0b7410497ea1.png) no-repeat center top / 100% 100%;
			display: flex;
			width: 688px;
			min-height: 800px;
			justify-content: flex-start;
			flex-wrap: wrap;
		}
		.title_view {
			padding: 0px;
			margin: 180px auto 60px;
			color: #333;
			font-weight: 600;
			width: 80%;
			font-size: 22px;
			text-align: center;
		}
		// item盒子
		.list_item {
			margin: 0  auto 30px;
			display: flex;
			width: 70%;
			justify-content: flex-start;
			align-items: center;
			// label
			.list_label {
				color: #666;
				width: 110px;
				font-size: 14px;
				line-height: 36px;
				text-align: right;
			}
			// 输入框
			.list_inp {
				border: 1px solid #eee;
				border-radius: 0px;
				padding: 0 10px;
				color: #666;
				background: #fff;
				width: calc(100% - 110px);
				line-height: 44px;
				height: 44px;
			}
		}
		.list_type {
			margin: 10px auto;
			display: flex;
			width: 70%;
			justify-content: flex-start;
			align-items: center;
			order: 3;
			.list_label {
				color: #666;
				background: none;
				width: 110px;
				font-size: 14px;
				line-height: 36px;
				text-align: right;
			}
			// 下拉框样式
			:deep(.el-select) {
				border: 1px solid #eee;
				border-radius: 0px;
				padding: 0 10px;
				color: #666;
				background: #fff;
				width: calc(100% - 110px);
				font-size: 14px;
				line-height: 44px;
				box-sizing: border-box;
				height: 44px;
				//去掉默认样式
				.select-trigger{
					height: 100%;
					.el-input{
						height: 100%;
						.el-input__wrapper{
							border: none;
							box-shadow: none;
							background: none;
							border-radius: 0;
							height: 100%;
							padding: 0;
						}
						.is-focus {
							box-shadow: none !important;
						}
					}
				}
			}
		}
		// 记住密码样式
		.remember_view {
			padding: 0 0 0 110px;
			margin: 0  auto 30px;
			width: 70%;
			text-align: center;
		
			// 未选中样式
			:deep(.el-checkbox) {
				margin: 0;
				display: flex;
				width: 20%;
				justify-content: center;
				align-items: center;
				// 复选框
				.el-checkbox__inner {
					border: 1px solid #DCDFE6;
					background: #fff;
				}
				// 提示文字
				.el-checkbox__label{
					color: #999;
				}
			}
			// 选中样式
			:deep(.is-checked) {
				//复选框
				.el-checkbox__inner {
					background-color: rgba(99,126,36,1);
					border-color: rgba(99,126,36,1);
				}
				// 提示文字
				.el-checkbox__label{
					color: rgba(99,126,36,1);
				}
			}
		}
		// 按钮盒子
		.btn_view {
			padding: 0 0 0 110px;
			margin: 30px auto 0;
			display: flex;
			width: 70%;
			justify-content: flex-start;
			align-items: center;
			flex-wrap: wrap;
			order: 5;
			// 登录
			.login {
				border: 0px solid #ff9900;
				cursor: pointer;
				border-radius: 2px;
				padding: 0 24px;
				margin: 0 10px 10px 0;
				color: #fff;
				background: linear-gradient(180deg, rgba(163,207,63,1) 0%, rgba(99,126,36,1) 100%);
				display: inline-block;
				letter-spacing: 4px;
				width: auto;
				font-size: 16px;
				height: 44px;
			}
			// 注册
			.register {
				border: 1px solid #eee;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 10px;
				margin: 0 10px 10px 0;
				color: #333;
				background: #fff;
				display: inline-block;
				width: auto;
				font-size: 14px;
				height: 44px;
			}
		}
	}

</style>