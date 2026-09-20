<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="50%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="12">
						<el-form-item label="产品名称" prop="chanpinmingcheng">
							<el-input class="list_inp" v-model="form.chanpinmingcheng" placeholder="产品名称"
								 type="text" 								:readonly="!isAdd||disabledForm.chanpinmingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="产品分类" prop="chanpinfenlei">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.chanpinfenlei?true:false"
								v-model="form.chanpinfenlei" 
								placeholder="请选择产品分类"
								>
								<el-option v-for="(item,index) in chanpinfenleiLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item prop="tupian"
									  label="图片"
						>
							<uploads
								:disabled="!isAdd||disabledForm.tupian?true:false"
								action="file/upload"

								tip="请上传图片"
								:limit="3"
								style="width: 100%;text-align: left;"
								:fileUrls="form.tupian?form.tupian:''" 
								@change="tupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="12">
						<el-form-item label="规格" prop="guige">
							<el-input class="list_inp" v-model="form.guige" placeholder="规格"
								 type="text" 								:readonly="!isAdd||disabledForm.guige?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="农民账号" prop="nongminzhanghao">
							<el-input class="list_inp" v-model="form.nongminzhanghao" placeholder="农民账号"
								 type="text" 								:readonly="!isAdd||disabledForm.nongminzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="农民姓名" prop="nongminxingming">
							<el-input class="list_inp" v-model="form.nongminxingming" placeholder="农民姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.nongminxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="价格" prop="price">
							<el-input class="list_inp" v-model.number="form.price" placeholder="价格"
								 type="number" 								:readonly="!isAdd||disabledForm.price?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="单限" prop="onelimittimes">
							<el-input class="list_inp" v-model.number="form.onelimittimes" placeholder="单限"
								 type="text" 								:readonly="!isAdd||disabledForm.onelimittimes?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="库存" prop="alllimittimes">
							<el-input class="list_inp" v-model.number="form.alllimittimes" placeholder="库存"
								 type="text" 								:readonly="!isAdd||disabledForm.alllimittimes?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="12">
						<el-form-item label="地址" prop="fulladdress">
							<el-input class="list_inp" v-model="form.fulladdress" placeholder="地址" readonly @click.native="mapClick" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="产品详情" prop="chanpinxiangqing">
							<editor :value="form.chanpinxiangqing" placeholder="请输入产品详情" :readonly="!isAdd||disabledForm.chanpinxiangqing?true:false"
								class="list_editor" @change="(e)=>editorChange(e,'chanpinxiangqing')"></editor>
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
		<locationForm ref="location" :toParentsMap="form" @mapData="getAddress"></locationForm>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'nongchanpinxinxi'
	const formName = '农产品信息'
	//基础信息
	import locationForm from '@/components/common/location.vue'
	
	const location = ref(null)
	
	const mapClick = () => {
		if(!isAdd.value||disabledForm.fulladdress){
			return false
		}
		location.value.mapShow()
	}
	
	const getAddress = (e) => {
		form.value.longitude = e.lng
		form.value.latitude = e.lat
		form.value.fulladdress = e.fulladdress
	}
	//form表单
	const form = ref({})
	const disabledForm = ref({
		chanpinmingcheng : false,
		chanpinfenlei : false,
		tupian : false,
		guige : false,
		chanpinxiangqing : false,
		nongminzhanghao : false,
		nongminxingming : false,
		price : false,
		onelimittimes : false,
		alllimittimes : false,
		longitude : false,
		latitude : false,
		fulladdress : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		chanpinmingcheng: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		chanpinfenlei: [
			{required: true,message: '请输入',trigger: 'blur'}, 
		],
		tupian: [
		],
		guige: [
		],
		chanpinxiangqing: [
		],
		nongminzhanghao: [
		],
		nongminxingming: [
		],
		price: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		onelimittimes: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		alllimittimes: [
			{ validator: validateIntNumber, trigger: 'blur' },
		],
		longitude: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		latitude: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		fulladdress: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//产品分类列表
	const chanpinfenleiLists = ref([])
	//图片上传回调
	const tupianUploadSuccess=(e)=>{
		form.value.tupian = e
	}
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			chanpinmingcheng: '',
			chanpinfenlei: '',
			tupian: '',
			guige: '',
			chanpinxiangqing: '',
			nongminzhanghao: '',
			nongminxingming: '',
			price: '0',
			onelimittimes: '-1',
			alllimittimes: '-1',
			longitude: '',
			latitude: '',
			fulladdress: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			res.data.data.chanpinxiangqing = res.data.data.chanpinxiangqing?(res.data.data.chanpinxiangqing.replace(reg,'../../../cl15067209/file')):'';
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='chanpinmingcheng'){
					form.value.chanpinmingcheng = row[x];
					disabledForm.value.chanpinmingcheng = true;
					continue;
				}
				if(x=='chanpinfenlei'){
					form.value.chanpinfenlei = row[x];
					disabledForm.value.chanpinfenlei = true;
					continue;
				}
				if(x=='tupian'){
					form.value.tupian = row[x];
					disabledForm.value.tupian = true;
					continue;
				}
				if(x=='guige'){
					form.value.guige = row[x];
					disabledForm.value.guige = true;
					continue;
				}
				if(x=='chanpinxiangqing'){
					form.value.chanpinxiangqing = row[x];
					disabledForm.value.chanpinxiangqing = true;
					continue;
				}
				if(x=='nongminzhanghao'){
					form.value.nongminzhanghao = row[x];
					disabledForm.value.nongminzhanghao = true;
					continue;
				}
				if(x=='nongminxingming'){
					form.value.nongminxingming = row[x];
					disabledForm.value.nongminxingming = true;
					continue;
				}
				if(x=='price'){
					form.value.price = row[x];
					disabledForm.value.price = true;
					continue;
				}
				if(x=='onelimittimes'){
					form.value.onelimittimes = row[x];
					disabledForm.value.onelimittimes = true;
					continue;
				}
				if(x=='alllimittimes'){
					form.value.alllimittimes = row[x];
					disabledForm.value.alllimittimes = true;
					continue;
				}
				if(x=='longitude'){
					form.value.longitude = row[x];
					disabledForm.value.longitude = true;
					continue;
				}
				if(x=='latitude'){
					form.value.latitude = row[x];
					disabledForm.value.latitude = true;
					continue;
				}
				if(x=='fulladdress'){
					form.value.fulladdress = row[x];
					disabledForm.value.fulladdress = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			form.value.price='0'
			form.value.onelimittimes='-1'
			form.value.alllimittimes='-1'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('nongminzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.nongminzhanghao = json.nongminzhanghao
				disabledForm.value.nongminzhanghao = true;
			}
			if(json.hasOwnProperty('nongminxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.nongminxingming = json.nongminxingming
				disabledForm.value.nongminxingming = true;
			}
		})
		context?.$http({
			url: `option/chanpinfenlei/chanpinfenlei`,
			method: 'get'
		}).then(res=>{
			chanpinfenleiLists.value = res.data.data
		})
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		if(form.value.tupian!=null) {
			form.value.tupian = form.value.tupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								emit('formModelChange')
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						emit('formModelChange')
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 0px solid #ddd;
		border-radius: 4px;
		padding: 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 150px 20px 0;
			background: none;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 font-weight: 500;
			 display: block;
			 width: 150px;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 0px solid #eee;
					border-radius: 0px;
					padding: 0 10px;
					clip-path: polygon(98% 0, 100% 51%, 98% 100%, 2% 100%, 0% 50%, 2% 0);
					background: #eee;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 250px;
					height: 36px;
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
				// 下拉框
				.list_sel {
					border: 0px solid #eee;
					border-radius: 0px;
					padding: 0 10px;
					clip-path: polygon(98% 0, 100% 51%, 98% 100%, 2% 100%, 0% 50%, 2% 0);
					background: #eee;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 250px;
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
				// 富文本
				.list_editor {
					background-color: #eee;
					border-radius: 0;
					padding: 0;
					margin: 0;
					width: auto;
					min-height: 320px;
					border-color: #eee;
					border-width: 1px;
					border-style: solid;
					min-width: 100%;
					height: auto;
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 14px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px solid #eee;
						cursor: pointer;
						background-color: #eee;
						border-radius: 0px;
						clip-path: polygon(90% 0, 100% 51%, 90% 100%, 10% 100%, 0% 50%, 10% 0);
						width: 120px;
						line-height: 70px;
						text-align: center;
						height: 60px;
						//图标
						.el-icon{
							color: #999;
							font-size: 26px;
						}
					}
					.el-upload-list__item {
						border: 1px solid #eee;
						cursor: pointer;
						background-color: #eee;
						border-radius: 0px;
						clip-path: polygon(90% 0, 100% 51%, 90% 100%, 10% 100%, 0% 50%, 10% 0);
						width: 120px;
						line-height: 70px;
						text-align: center;
						height: 60px;
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
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
		.formModel_cancel:hover {
		}
		
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
		.formModel_confirm:hover {
		}
	}
</style>