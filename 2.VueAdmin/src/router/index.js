	import {
		createRouter,
		createWebHashHistory
	} from 'vue-router'
	import news from '@/views/news/list'
	import address from '@/views/address/list'
	import dianpuxinxi from '@/views/dianpuxinxi/list'
	import yonghufankui from '@/views/yonghufankui/list'
	import nongmin from '@/views/nongmin/list'
	import users from '@/views/users/list'
	import cart from '@/views/cart/list'
	import forum from '@/views/forum/list'
	import chanpinfenlei from '@/views/chanpinfenlei/list'
	import yonghu from '@/views/yonghu/list'
	import discussdianpuxinxi from '@/views/discussdianpuxinxi/list'
	import nongchanpinxinxi from '@/views/nongchanpinxinxi/list'
	import orders from '@/views/orders/list'
	import config from '@/views/config/list'
	import discussnongchanpinxinxi from '@/views/discussnongchanpinxinxi/list'
	import nongminRegister from '@/views/nongmin/register'
	import nongminCenter from '@/views/nongmin/center'

export const routes = [{
		path: '/login',
		name: 'login',
		component: () => import('../views/login.vue')
	},{
		path: '/',
		name: '首页',
		component: () => import('../views/index'),
		children: [{
			path: '/',
			name: '首页Home',
			component: () => import('../views/HomeView.vue'),
			meta: {
				affix: true
			}
		}, {
			path: '/updatepassword',
			name: '修改密码',
			component: () => import('../views/updatepassword.vue')
		}
		
		,{
			path: '/nongminCenter',
			name: '农民个人中心',
			component: nongminCenter
		}
		,{
			path: '/news',
			name: '公告资讯',
			component: news
		}
		,{
			path: '/address',
			name: '地址',
			component: address
		}
		,{
			path: '/dianpuxinxi',
			name: '店铺信息',
			component: dianpuxinxi
		}
		,{
			path: '/yonghufankui',
			name: '用户反馈',
			component: yonghufankui
		}
		,{
			path: '/nongmin',
			name: '农民',
			component: nongmin
		}
		,{
			path: '/users',
			name: '管理员',
			component: users
		}
		,{
			path: '/cart',
			name: '购物车',
			component: cart
		}
		,{
			path: '/forum',
			name: '我的发布',
			component: forum
		}
		,{
			path: '/chanpinfenlei',
			name: '产品分类',
			component: chanpinfenlei
		}
		,{
			path: '/yonghu',
			name: '用户',
			component: yonghu
		}
		,{
			path: '/discussdianpuxinxi',
			name: '店铺信息评论',
			component: discussdianpuxinxi
		}
		,{
			path: '/nongchanpinxinxi',
			name: '农产品信息',
			component: nongchanpinxinxi
		}
		,{
			path: '/orders',
			name: '订单管理',
			component: orders
		}
		,{
			path: '/config',
			name: '轮播图',
			component: config
		}
		,{
			path: '/discussnongchanpinxinxi',
			name: '农产品信息评论',
			component: discussnongchanpinxinxi
		}
		]
	},
	{
		path: '/nongminRegister',
		name: '农民注册',
		component: nongminRegister
	},
]

const router = createRouter({
	history: createWebHashHistory(process.env.BASE_URL),
	routes
})

export default router
