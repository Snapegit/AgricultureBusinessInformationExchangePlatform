import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 店铺信息
const DianpuxinxiModel = sequelize.define('DianpuxinxiModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	dianpumingcheng: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '店铺名称'
	},
	dianputupian: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '店铺图片'
	},
	shoumaichanpin: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '售卖产品'
	},
	dianpuxiangqing: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '店铺详情'
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
	lianxidianhua: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '联系电话'
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
	tableName: 'dianpuxinxi'
})

export default DianpuxinxiModel
