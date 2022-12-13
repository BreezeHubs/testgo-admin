import request from '@/utils/request'

// 查询UserIdentity列表
export function listUserIdentity(query) {
    return request({
        url: '/api/v1/user-identity',
        method: 'get',
        params: query
    })
}

// 查询UserIdentity详细
export function getUserIdentity (id) {
    return request({
        url: '/api/v1/user-identity/' + id,
        method: 'get'
    })
}


// 新增UserIdentity
export function addUserIdentity(data) {
    return request({
        url: '/api/v1/user-identity',
        method: 'post',
        data: data
    })
}

// 修改UserIdentity
export function updateUserIdentity(data) {
    return request({
        url: '/api/v1/user-identity/'+data.id,
        method: 'put',
        data: data
    })
}

// 删除UserIdentity
export function delUserIdentity(data) {
    return request({
        url: '/api/v1/user-identity',
        method: 'delete',
        data: data
    })
}

