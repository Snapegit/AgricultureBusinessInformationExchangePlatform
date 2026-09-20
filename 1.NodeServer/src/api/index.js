import { Router } from 'express'
import UsersController from './Users'
import FileController from './File'
import ConfigController from './Config'
import CommonController from './Common'
import NewsController from './News'
import YonghuController from './Yonghu'
import NongminController from './Nongmin'
import DianpuxinxiController from './Dianpuxinxi'
import ChanpinfenleiController from './Chanpinfenlei'
import NongchanpinxinxiController from './Nongchanpinxinxi'
import CartController from './Cart'
import AddressController from './Address'
import OrdersController from './Orders'
import ForumController from './Forum'
import YonghufankuiController from './Yonghufankui'
import MenuController from './Menu'
import DiscussdianpuxinxiController from './Discussdianpuxinxi'
import DiscussnongchanpinxinxiController from './Discussnongchanpinxinxi'

export default ({ config, db }) => {
	let api = Router()

	api.use('/users', UsersController({ config, db }))

	api.use('/file', FileController({ config, db }))

	api.use('/config', ConfigController({ config, db }))

	api.use('/', CommonController({ config, db }))

	api.use('/config', ConfigController({ config, db }))

	api.use('/users', UsersController({ config, db }))

	api.use('/news', NewsController({ config, db }))

	api.use('/yonghu', YonghuController({ config, db }))

	api.use('/nongmin', NongminController({ config, db }))

	api.use('/dianpuxinxi', DianpuxinxiController({ config, db }))

	api.use('/chanpinfenlei', ChanpinfenleiController({ config, db }))

	api.use('/nongchanpinxinxi', NongchanpinxinxiController({ config, db }))

	api.use('/cart', CartController({ config, db }))

	api.use('/address', AddressController({ config, db }))

	api.use('/orders', OrdersController({ config, db }))

	api.use('/forum', ForumController({ config, db }))

	api.use('/yonghufankui', YonghufankuiController({ config, db }))

	api.use('/menu', MenuController({ config, db }))

	api.use('/discussdianpuxinxi', DiscussdianpuxinxiController({ config, db }))

	api.use('/discussnongchanpinxinxi', DiscussnongchanpinxinxiController({ config, db }))

	return api
}
