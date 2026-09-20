<template>
	<div>
		<div class="forget_view">
			<el-form :model="forgetForm" class="forget_box">
				<div class="forget_title">基于农商信息交流平台{{pageType==1?'找回密码':pageType==2?'输入密保':'重置密码'}}</div>
				<div class="tab_view">
					<div class="tab" :class="pageType==1?'tab_active':''">找回密码</div>
					<div class="tab" :class="pageType==2?'tab_active tab_active1':''">输入密保</div>
					<div class="tab" :class="pageType==3?'tab_active tab_active1 tab_active2':''">重置密码</div>
				</div>
			</el-form>
		</div>
	</div>
</template>
<script setup>
	import {
		ref,
		getCurrentInstance,
		nextTick,
	} from 'vue';
	const context = getCurrentInstance()?.appContext.config.globalProperties;
	const pageType = ref(1)
	const forgetForm = ref({})
	const userForm = ref({})
	//返回登录
	const close = () => {
		context?.$router.push({
			path: "/login"
		});
	}
</script>

<style lang="scss" scoped>
	.forget_view {
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
		.forget_box {
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
			// 标题
			.forget_title {
				padding: 0px;
				margin: 180px 0 60px 12%;
				color: #333;
				font-weight: 600;
				width: 78%;
				font-size: 22px;
				text-align: center;
			}
			// tab
			// 盒子
			.tab_view {
				padding: 0 0 50px;
				margin: 0 auto;
				display: flex;
				width: 70%;
				align-items: center;
				// 默认样式
				.tab {
					padding: 16px 0;
					width: calc(100% / 3);
					font-size: 14px;
					box-sizing: border-box;
					text-align: center;
				}
				// 选中样式一
				.tab_active {
					clip-path: polygon(00% 0%, 92% 00%, 100% 50%, 92% 100%, 0 100%, 8% 50%);
					color: #000;
					background: rgba(99,126,36,.3);
				}
				// 选中样式二
				.tab_active1 {
					color: #000;
					background: rgba(99,126,36,.3);
				}
				// 选中样式三
				.tab_active2 {
					color: #000;
					background: rgba(99,126,36,.3);
				}
			}
			// item
			.list_item {
				margin: 0 auto 30px;
				display: flex;
				width: 70%;
				justify-content: flex-start;
				align-items: center;
				// label
				.item_label {
					background: none;
					display: block;
					width: 130px;
					font-size: 14px;
					line-height: 36px;
					box-sizing: border-box;
					text-align: right;
					height: 36px;
				}
				// 输入框
				:deep(.list_inp) {
					border: 1px solid #eee;
					border-radius: 0px;
					padding: 0 10px;
					color: #666;
					background: #fff;
					width: 80%;
					line-height: 44px;
					box-sizing: border-box;
					height: 44px;
					//去掉默认样式
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
				//下拉框样式
				:deep(.list_sel) {
					border: 1px solid #eee;
					border-radius: 0px;
					padding: 0 10px;
					color: #666;
					background: #fff;
					width: 80%;
					line-height: 44px;
					box-sizing: border-box;
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
			// 按钮盒子
			.list_btn {
				margin: 20px auto 0;
				display: flex;
				width: 70%;
				justify-content: center;
				align-items: center;
				flex-wrap: wrap;
				// 获取密保
				:deep(.el-button--success) {
					border: 0;
					cursor: pointer;
					border-radius: 4px;
					padding: 0 40px;
					margin: 0 10px 0 0;
					color: #fff;
					background: linear-gradient(180deg, rgba(163,207,63,1) 0%, rgba(99,126,36,1) 100%);
					width: auto;
					font-size: 16px;
					height: 44px;
				}
				// 获取密保悬浮
				:deep(.el-button--success:hover) {
				}
				// 确认密保
				:deep(.el-button--primary) {
					border: 0;
					cursor: pointer;
					border-radius: 4px;
					padding: 0 40px;
					margin: 0 10px 0 0;
					color: #fff;
					background: linear-gradient(180deg, rgba(163,207,63,1) 0%, rgba(99,126,36,1) 100%);
					width: auto;
					font-size: 16px;
					height: 44px;
				}
				// 确认密保悬浮
				:deep(.el-button--primary:hover) {
				}
				// 重置密码
				:deep(.el-button--warning) {
					border: 0;
					cursor: pointer;
					border-radius: 4px;
					padding: 0 40px;
					margin: 0 10px 0 0;
					color: #fff;
					background: linear-gradient(180deg, rgba(163,207,63,1) 0%, rgba(99,126,36,1) 100%);
					width: auto;
					font-size: 16px;
					height: 44px;
				}
				// 重置密码悬浮
				:deep(.el-button--warning:hover) {
				}
				.r-login {
					cursor: pointer;
					padding: 10px 0 0;
					color: #999;
					width: 100%;
					font-size: 14px;
					text-align: right;
				}
			}
		}
	}

	
</style>
