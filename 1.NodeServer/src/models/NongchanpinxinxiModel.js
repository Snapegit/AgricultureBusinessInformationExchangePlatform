import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 农产品信息
const NongchanpinxinxiModel = sequelize.define('NongchanpinxinxiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	chanpinmingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '产品名称'
	},
	chanpinfenlei: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '产品分类'
	},
	tupian: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '图片'
	},
	guige: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '规格'
	},
	chanpinxiangqing: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '产品详情'
	},
	nongminzhanghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '农民账号'
	},
	nongminxingming: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '农民姓名'
	},
	price: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '价格'
	},
	onelimittimes: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '单限'
	},
	alllimittimes: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '库存'
	},
	longitude: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '经度'
	},
	latitude: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '纬度'
	},
	fulladdress: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '地址'
	},
	addtime: {
  		type: DataTypes.DATE,
  		defaultValue: DataTypes.NOW,
    	allowNull: false,
    	get() {
            return moment(this.getDataValue('addtime')).format('YYYY-MM-DD HH:mm:ss')
        },
		comment: '添加时间'
	}
}, {
	timestamps: false,
	freezeTableName: true,
	tableName: 'nongchanpinxinxi'
})

export default NongchanpinxinxiModel
