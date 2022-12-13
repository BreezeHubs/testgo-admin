import request from '@/utils/request'

// 查询UserIdentityBind列表
export function listUserIdentityBind(query) {
    return request({
        url: '/api/v1/user-identity-bind',
        method: 'get',
        params: query
    })
}

// 查询UserIdentityBind详细
export function getUserIdentityBind (id) {
    return request({
        url: '/api/v1/user-identity-bind/' + id,
        method: 'get'
    })
}


// 新增UserIdentityBind
export function addUserIdentityBind(data) {
    return request({
        url: '/api/v1/user-identity-bind',
        method: 'post',
        data: data
    })
}

// 修改UserIdentityBind
export function updateUserIdentityBind(data) {
    return request({
        url: '/api/v1/user-identity-bind/'+data.id,
        method: 'put',
        data: data
    })
}

// 删除UserIdentityBind
export function delUserIdentityBind(data) {
    return request({
        url: '/api/v1/user-identity-bind',
        method: 'delete',
        data: data
    })
}

