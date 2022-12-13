import request from '@/utils/request'

// 查询UserInfo列表
export function listUserInfo(query) {
    return request({
        url: '/api/v1/user-info',
        method: 'get',
        params: query
    })
}

// 查询UserInfo详细
export function getUserInfo (id) {
    return request({
        url: '/api/v1/user-info/' + id,
        method: 'get'
    })
}


// 新增UserInfo
export function addUserInfo(data) {
    return request({
        url: '/api/v1/user-info',
        method: 'post',
        data: data
    })
}

// 修改UserInfo
export function updateUserInfo(data) {
    return request({
        url: '/api/v1/user-info/'+data.id,
        method: 'put',
        data: data
    })
}

// 删除UserInfo
export function delUserInfo(data) {
    return request({
        url: '/api/v1/user-info',
        method: 'delete',
        data: data
    })
}

