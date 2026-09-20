<template>
	<router-view />
</template>
<script setup>
	import * as echarts from "echarts";
	import {
		provide
	} from "vue";
	provide("echarts", echarts);
	provide("baseUrl", process.env.VUE_APP_BASE_API)
	const debounce = (fn, delay) => {
		let timer = null;
		return function() {
			let context = this;
			let args = arguments;
			clearTimeout(timer);
			timer = setTimeout(function() {
				fn.apply(context, args);
			}, delay);
		}
	}
	
	const _ResizeObserver = window.ResizeObserver;
	window.ResizeObserver = class ResizeObserver extends _ResizeObserver {
		constructor(callback) {
			callback = debounce(callback, 16);
			super(callback);
		}
	}
</script>
<style lang="scss">
	#app {
		font-family: Avenir, Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		// text-align: center;
		color: #2c3e50;
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		// 取消按钮
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 10px;
			padding: 0 24px 0 34px;
			margin: 0 20px 0 0;
			clip-path: polygon(5% 0, 100% 0%, 95% 100%, 0% 100%);
			color: #fff;
			background: url(http://clfile.zggen.cn/20240410/189ad7c83d664e8ca2e346f3ad3382d6.png) no-repeat 15px center / 22px,#be696d;
			width: auto;
			font-size: 16px;
			min-width: 120px;
			height: 40px;
		}
		// 取消按钮-悬浮
		.formModel_cancel:hover {
		}
		// 确定按钮
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 10px;
			padding: 0 24px 0 34px;
			margin: 0 20px 0 0;
			clip-path: polygon(5% 0, 100% 0%, 95% 100%, 0% 100%);
			color: #fff;
			background: url(http://clfile.zggen.cn/20240410/88deaa83cd7d4621a113e1e9810aae3c.png) no-repeat 15px center / 24px,#64ac56;
			width: auto;
			font-size: 16px;
			min-width: 120px;
			height: 40px;
		}
		// 确定按钮-悬浮
		.formModel_confirm:hover {
		}
	}
	.app-contain {
		padding: 20px 20px;
		margin: 0;
		color: #666;
		font-size: 14px;
		min-height: 100vh;
		height: auto;
	}
	body {
		margin: 0;
	}
	* {
		box-sizing: border-box;
	}
	.el-select .el-input {
		font-size: inherit;
	}
	.el-input__inner {
		color: inherit;
	}
	nav {
		padding: 30px;

		a {
			font-weight: bold;
			color: #2c3e50;

			&.router-link-exact-active {
				color: #42b983;
			}
		}
	}
</style>