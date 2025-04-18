// 导入axios
import axios from "axios";
// 导入ElementUI的通知消息的组件Notification, 用于弹出后端返回的业务message
import {Notification} from "element-ui";
// 导入路由器对象, 用于检测到后面session过期时, 在后置拦截器中直接跳转到登录页面
import router from "@/router";

// 创建Axios实例, 并配置基础属性
const instance = axios.create({
    // 配置后端基础url地址
    baseURL: 'http://localhost:99',
    // 配置请求超时事件
    timeout: 10000,
    // 配置请求体中的内容数据格式
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    // 配置携带cookie (跨域时,axios默认不携带cookie, 会造成后端session失效)
    // 因为后端session的识别依赖于cookie中的sessionID
    // 如果不携带cookie, 会造成每次请求, 后端都会创建新的session
    // withCredentials: true
})
// 配置http前置拦截器
// user() 里面写2个Lambda表达式作为2种情况的回调
// 第一个回调跨域拿到一个config对象,他是http请求的配置对象
instance.interceptors.request.use(
    config => {
        // 每次发起http请求时, 从localStorage中取出token令牌放入请求头里面
        // 从localStorage获取token
        const token = localStorage.getItem('token');

        // 如果token存在，添加到请求头（推荐用Bearer最token前缀方案）
        // 需要与后端进行协议, 从请求头中取出token的头部字段名是Authorization
        // 需要与后端进行协议, token的前缀是Bearer
        if (token) {
            config.headers['Authorization'] = `Bearer ${token}`;
        }
        return config
    },
    error => {
        return Promise.reject(error)
    }
)
// 配置http后置拦截器
// 有2个回调
// response => {} 在后端http成功响应后执行 (http成功, 但业务未必成功)
// error => {} 在后端http失败后执行 (http失败, 业务一定失败)
instance.interceptors.response.use(
    response => {
        // 这个response就是服务器返回的响应报文
        // 拿到response响应体中的数据 => 对应的后端返回的result对象
        // 这个result对象里面包含统一的业务结果code, message, data
        const result = response.data
        // 跟后端约定好, 只是业务成功, 返回的code必须是200
        if (result.code !== '200') {
            // 跟后端约定好, 如果code是5001或5002, 前端认为是token过期或无效
            if (result.code === '5001' || result.code === '5002' ) {

                // 前端移除token
                localStorage.removeItem('token')
                // 跳转到登录页面
                router.replace('/login')
            }
            // 统一弹出result对象中携带的错误消息
            Notification.error(result.message)
            // 拦截器进行拦截, 不再继续进入then()方法执行
            return Promise.reject(new Error(result.message))
        } else {
            // 返回result中的data, 继续进入then方法执行
            return result.data
        }
    },
    error => {
        // 这个response就是服务器返回的错误报文
        // ----------- 处理HTTP网络错误（如4xx/5xx） -----------
        let message = '请求失败'
        if (error.response) {
            // 服务器有响应（状态码非2xx）
            message = handleHttpError(error.response.status)
        } else if (error.message.includes('timeout')) {
            message = '请求超时'
        } else if (error.message.includes('Network Error')) {
            message = '网络连接异常'
        }
        Notification.error(message)
        return Promise.reject(error)
    }
)


// HTTP状态码错误处理映射
function handleHttpError(status) {
    const map = {
        400: '请求参数错误',
        401: '登录已过期，请重新登录',
        403: '拒绝访问',
        404: '请求资源未找到',
        405: '请求方法不允许',
        500: '服务器内部错误',
        502: '网关错误',
        503: '服务不可用',
        504: '网关超时'
    }
    return map[status] || '服务器异常'
}

// 导出实例
export default instance