import request from '@/utils/request'

// 查询User列表
export function listUser(query) {
    return request({
        url: '/api/v1/user',
        method: 'get',
        params: query
    })
}

// 查询User详细
export function getUser (id) {
    return request({
        url: '/api/v1/user/' + id,
        method: 'get'
    })
}


// 新增User
export function addUser(data) {
    return request({
        url: '/api/v1/user',
        method: 'post',
        data: data
    })
}

// 修改User
export function updateUser(data) {
    return request({
        url: '/api/v1/user/'+data.id,
        method: 'put',
        data: data
    })
}

// 删除User
export function delUser(data) {
    return request({
        url: '/api/v1/user',
        method: 'delete',
        data: data
    })
}

