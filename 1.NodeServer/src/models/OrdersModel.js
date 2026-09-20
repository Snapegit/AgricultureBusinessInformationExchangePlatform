import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 商品订单
const OrdersModel = sequelize.define('OrdersModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	orderid: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '订单编号'
	},
	tablename: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '商品表名'
	},
	goodid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '商品id'
	},
	goodname: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '商品名称'
	},
	picture: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '图片'
	},
	buynumber: {
		type: DataTypes.INTEGER,
		defaultValue: 0,
		allowNull: true,
		comment: '购买数量'
	},
	price: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '单价'
	},
	discountprice: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '折扣价'
	},
	total: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '总价'
	},
	discounttotal: {
		type: DataTypes.DOUBLE,
		defaultValue: 0,
		allowNull: true,
		comment: '折扣总价格'
	},
	type: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '支付类型'
	},
	status: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '订单状态'
	},
	address: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '地址'
	},
	tel: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '电话'
	},
	consignee: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '收货人'
	},
	remark: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '备注'
	},
	logistics: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '物流'
	},
	addtime: {
		type: DataTypes.DATE,
		allowNull: true,
		get() {
            return moment(this.getDataValue('addtime')).format('YYYY-MM-DD HH:mm:ss')
        },
		defaultValue: DataTypes.NOW,
		comment: '创建时间'
	},
	userid: {
		type: DataTypes.BIGINT,
		defaultValue: 0,
		allowNull: true,
		comment: '用户id'
	},
	nongminzhanghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '商户名称'
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
	tableName: 'orders'
})

export default OrdersModel
