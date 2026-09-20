import { Sequelize, DataTypes } from 'sequelize'
import moment from 'moment'
import sequelize from './sequelize'

// 农民
const NongminModel = sequelize.define('NongminModel', {
	id: {
		type: DataTypes.BIGINT,
		primaryKey: true,
		autoIncrement: true,
		allowNull: false,
		comment: '主键id'
	},
	nongminzhanghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '农民账号'
	},
	nongminmima: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '农民密码'
	},
	nongminxingming: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '农民姓名'
	},
	touxiang: {
		type: DataTypes.TEXT,
		defaultValue: '',
		allowNull: true,
		comment: '头像'
	},
	xingbie: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '性别'
	},
	lianxidianhua: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '联系电话'
	},
	shenfenzhenghao: {
		type: DataTypes.STRING,
		defaultValue: '',
		allowNull: true,
		comment: '身份证号'
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
	tableName: 'nongmin'
})

export default NongminModel
