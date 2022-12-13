<template>
  <BasicLayout>
    <template #wrapper>
      <el-card class="box-card">
        <el-form
          ref="queryForm"
          :model="queryParams"
          :inline="true"
          label-width="68px"
        >
          <el-form-item label="如祺用户ID" prop="userId"
            ><el-input
              v-model="queryParams.userId"
              placeholder="请输入如祺用户ID"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="人设ID" prop="identityId"
            ><el-select
              v-model="queryParams.identityId"
              placeholder="请选择"
              clearable
              size="small"
            >
              <el-option
                v-for="dict in identityIdOptions"
                :key="dict.key"
                :label="dict.value"
                :value="dict.key"
              />
            </el-select>
          </el-form-item>
          <el-form-item label="微信昵称" prop="nickname"
            ><el-input
              v-model="queryParams.nickname"
              placeholder="请输入微信昵称"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="注册城市：地级市" prop="registerCity"
            ><el-input
              v-model="queryParams.registerCity"
              placeholder="请输入注册城市：地级市"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="查找总里程数超越X%的用户" prop="mileageRankRate"
            ><el-input
              v-model="queryParams.mileageRankRate"
              placeholder="请输入查找总里程数超越X%的用户"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>
          <el-form-item label="如祺会员等级" prop="memberLevel"
            ><el-input
              v-model="queryParams.memberLevel"
              placeholder="请输入如祺会员等级"
              clearable
              size="small"
              @keyup.enter.native="handleQuery"
            />
          </el-form-item>

          <el-form-item>
            <el-button
              type="primary"
              icon="el-icon-search"
              size="mini"
              @click="handleQuery"
              >搜索</el-button
            >
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
              >重置</el-button
            >
          </el-form-item>
        </el-form>

        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              v-permisaction="['admin:userInfo:add']"
              type="primary"
              icon="el-icon-plus"
              size="mini"
              @click="handleAdd"
              >新增
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              v-permisaction="['admin:userInfo:edit']"
              type="success"
              icon="el-icon-edit"
              size="mini"
              :disabled="single"
              @click="handleUpdate"
              >修改
            </el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              v-permisaction="['admin:userInfo:remove']"
              type="danger"
              icon="el-icon-delete"
              size="mini"
              :disabled="multiple"
              @click="handleDelete"
              >删除
            </el-button>
          </el-col>
        </el-row>

        <el-table
          v-loading="loading"
          :data="userInfoList"
          @selection-change="handleSelectionChange"
        >
          <el-table-column type="selection" width="55" align="center" />

          <el-table-column
            label="如祺用户ID"
            align="center"
            prop="userId"
            :show-overflow-tooltip="true"
          /><el-table-column
            label="人设ID"
            align="center"
            prop="identityId"
            :formatter="identityIdFormat"
            width="100"
          >
            <template slot-scope="scope">
              {{ identityIdFormat(scope.row) }}
            </template>
          </el-table-column>
          <el-table-column
            label="微信昵称"
            align="center"
            prop="nickname"
            :show-overflow-tooltip="true"
          />
          <el-table-column
            label="注册城市：地级市"
            align="center"
            prop="registerCity"
            :show-overflow-tooltip="true"
          />
          <el-table-column
            label="注册时间：年/月/日"
            width="155"
            align="center"
            :formatter="dateFormat"
            prop="registerTime"
            :show-overflow-tooltip="true"
          >
            <template slot-scope="scope" width="155">
              <span>{{ dateFormat(scope.row.registerTime) }}</span>
            </template>
          </el-table-column>
          <el-table-column
            label="常用上/下车点Top2"
            align="center"
            prop="regularPointT2"
            :show-overflow-tooltip="true"
          />
          <el-table-column
            label="里程总公里数"
            align="center"
            prop="totalMileage"
            :show-overflow-tooltip="true"
          />
          <el-table-column
            label="订单折前流水总金额"
            align="center"
            prop="totalAmount"
            :show-overflow-tooltip="true"
          />
          <el-table-column
            label="订单实际支付总金额"
            align="center"
            prop="actuallyAmount"
            :show-overflow-tooltip="true"
          /><el-table-column
            label="最晚成单时间（03:00:00前下单数据）"
            align="center"
            prop="latestOrderTime"
            :show-overflow-tooltip="true"
          /><el-table-column
            label="总里程数超越X%用户"
            align="center"
            prop="mileageRankRate"
            :show-overflow-tooltip="true"
          /><el-table-column
            label="如祺会员等级"
            align="center"
            prop="memberLevel"
            :show-overflow-tooltip="true"
          />
          <el-table-column
            label="用户类型"
            align="center"
            prop="userType"
            :show-overflow-tooltip="true"
            :formatter="userTypeFormat"
          >
            <template slot-scope="scope" width="155">
              <span>{{ userTypeFormat(scope.row.userType) }}</span>
            </template>
          </el-table-column>
          <el-table-column
            label="是否抽过奖"
            align="center"
            prop="isDraw"
            :show-overflow-tooltip="true"
            :formatter="isDrawFormat"
          />
          <!-- <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                        <template slot-scope="scope">
                         <el-popconfirm
                           class="delete-popconfirm"
                           title="确认要修改吗?"
                           confirm-button-text="修改"
                           @onConfirm="handleUpdate(scope.row)"
                         >
                           <el-button
                             slot="reference"
                             v-permisaction="['admin:userInfo:edit']"
                             size="mini"
                             type="text"
                             icon="el-icon-edit"
                           >修改
                           </el-button>
                         </el-popconfirm>
                         <el-popconfirm
                            class="delete-popconfirm"
                            title="确认要删除吗?"
                            confirm-button-text="删除"
                            @onConfirm="handleDelete(scope.row)"
                         >
                            <el-button
                              slot="reference"
                              v-permisaction="['admin:userInfo:remove']"
                              size="mini"
                              type="text"
                              icon="el-icon-delete"
                            >删除
                            </el-button>
                         </el-popconfirm>
                        </template>
                    </el-table-column> -->
        </el-table>

        <pagination
          v-show="total > 0"
          :total="total"
          :page.sync="queryParams.pageIndex"
          :limit.sync="queryParams.pageSize"
          @pagination="getList"
        />

        <!-- 添加或修改对话框 -->
        <el-dialog :title="title" :visible.sync="open" width="500px">
          <el-form ref="form" :model="form" :rules="rules" label-width="80px">
            <el-form-item label="如祺用户ID" prop="userId">
              <el-input v-model="form.userId" placeholder="如祺用户ID" />
            </el-form-item>
            <el-form-item label="人设ID" prop="identityId">
              <el-select v-model="form.identityId" placeholder="请选择">
                <el-option
                  v-for="dict in identityIdOptions"
                  :key="dict.key"
                  :label="dict.value"
                  :value="dict.key"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="微信昵称" prop="nickname">
              <el-input v-model="form.nickname" placeholder="微信昵称" />
            </el-form-item>
            <el-form-item label="注册城市：地级市" prop="registerCity">
              <el-input
                v-model="form.registerCity"
                placeholder="注册城市：地级市"
              />
            </el-form-item>
            <el-form-item label="注册时间：年/月/日" prop="registerTime">
              <el-date-picker
                v-model="form.registerTime"
                type="datetime"
                placeholder="选择日期"
              >
              </el-date-picker>
            </el-form-item>
            <el-form-item
              label="常用上/下车点Top2，英文逗号分割"
              prop="regularPointT2"
            >
              <el-input
                v-model="form.regularPointT2"
                placeholder="常用上/下车点Top2，英文逗号分割"
              />
            </el-form-item>
            <el-form-item
              label="22年里程总公里数，无需小数点，四舍五入原则"
              prop="totalMileage"
            >
              <el-input
                v-model="form.totalMileage"
                placeholder="22年里程总公里数，无需小数点，四舍五入原则"
              />
            </el-form-item>
            <el-form-item label="22年订单折前流水总金额" prop="totalAmount">
              <el-input
                v-model="form.totalAmount"
                placeholder="22年订单折前流水总金额"
              />
            </el-form-item>
            <el-form-item label="22年订单实际支付总金额" prop="actuallyAmount">
              <el-input
                v-model="form.actuallyAmount"
                placeholder="22年订单实际支付总金额"
              />
            </el-form-item>
            <el-form-item
              label="22年最晚成单时间（03:00:00前下单数据）"
              prop="latestOrderTime"
            >
              <el-input
                v-model="form.latestOrderTime"
                placeholder="22年最晚成单时间（03:00:00前下单数据）"
              />
            </el-form-item>
            <el-form-item
              label="22年总里程数排行，超越X%用户"
              prop="mileageRankRate"
            >
              <el-input
                v-model="form.mileageRankRate"
                placeholder="22年总里程数排行，超越X%用户"
              />
            </el-form-item>
            <el-form-item label="如祺会员等级" prop="memberLevel">
              <el-input v-model="form.memberLevel" placeholder="如祺会员等级" />
            </el-form-item>
            <el-form-item
              label="用户类型：1新用户、2老用户22年未成单、3老用户已成单"
              prop="userType"
            >
              <el-input
                v-model="form.userType"
                placeholder="用户类型：1新用户、2老用户22年未成单、3老用户已成单"
              />
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitForm">确 定</el-button>
            <el-button @click="cancel">取 消</el-button>
          </div>
        </el-dialog>
      </el-card>
    </template>
  </BasicLayout>
</template>

<script>
import {
  addUserInfo,
  delUserInfo,
  getUserInfo,
  listUserInfo,
  updateUserInfo,
} from "@/api/admin/user-info";

import { listUserIdentity } from "@/api/admin/user-identity";
import moment from "moment";

export default {
  name: "UserInfo",
  components: {},
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 总条数
      total: 0,
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      isEdit: false,
      // 类型数据字典
      typeOptions: [],
      userInfoList: [],

      // 关系表类型
      identityIdOptions: [],

      // 查询参数
      queryParams: {
        pageIndex: 1,
        pageSize: 10,
        userId: undefined,
        identityId: undefined,
        nickname: undefined,
        registerCity: undefined,
        registerTime: undefined,
        mileageRankRate: undefined,
        memberLevel: undefined,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "如祺用户ID不能为空", trigger: "blur" },
        ],
        identityId: [
          { required: true, message: "人设ID不能为空", trigger: "blur" },
        ],
        nickname: [
          { required: true, message: "微信昵称不能为空", trigger: "blur" },
        ],
        registerCity: [
          {
            required: true,
            message: "注册城市：地级市不能为空",
            trigger: "blur",
          },
        ],
        mileageRankRate: [
          {
            required: true,
            message: "22年总里程数排行，超越X%用户不能为空",
            trigger: "blur",
          },
        ],
        memberLevel: [
          { required: true, message: "如祺会员等级不能为空", trigger: "blur" },
        ],
        userType: [
          { required: true, message: "用户类型不能为空", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getList();
    this.getUserIdentityItems();
  },
  methods: {
    isDrawFormat(row, column) {
      return row.isDraw == true ? "是" : "否";
    },
    dateFormat(time) {
      return moment(time).format("YYYY年MM月DD日");
    },
    userTypeFormat(ut) {
      if (ut == 1) {
        return "22年未成单用户";
      } else if (ut == 2) {
        return "22年有成单用户";
      } else {
        return "未知";
      }
    },

    /** 查询参数列表 */
    getList() {
      this.loading = true;
      listUserInfo(this.addDateRange(this.queryParams, this.dateRange)).then(
        (response) => {
          this.userInfoList = response.data.list;
          this.total = response.data.count;
          this.loading = false;
        }
      );
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        userId: undefined,
        identityId: undefined,
        nickname: undefined,
        registerCity: undefined,
        registerTime: undefined,
        regularPointT2: undefined,
        totalMileage: undefined,
        totalAmount: undefined,
        actuallyAmount: undefined,
        latestOrderTime: undefined,
        mileageRankRate: undefined,
        memberLevel: undefined,
        userType: undefined,
      };
      this.resetForm("form");
    },
    getImgList: function () {
      this.form[this.fileIndex] =
        this.$refs["fileChoose"].resultList[0].fullUrl;
    },
    fileClose: function () {
      this.fileOpen = false;
    },
    identityIdFormat(row) {
      return this.selectItemsLabel(this.identityIdOptions, row.identityId);
    },
    // 关系
    getUserIdentityItems() {
      this.getItems(listUserIdentity, undefined).then((res) => {
        this.identityIdOptions = this.setItems(res, "id", "name");
      });
    },
    // 文件
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageIndex = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.dateRange = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加用户基本信息";
      this.isEdit = false;
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids;
      getUserInfo(id).then((response) => {
        this.form = response.data;
        this.open = true;
        this.title = "修改用户基本信息";
        this.isEdit = true;
      });
    },
    /** 提交按钮 */
    submitForm: function () {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id !== undefined) {
            updateUserInfo(this.form).then((response) => {
              if (response.code === 200) {
                this.msgSuccess(response.msg);
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
          } else {
            addUserInfo(this.form).then((response) => {
              if (response.code === 200) {
                this.msgSuccess(response.msg);
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      var Ids = (row.id && [row.id]) || this.ids;

      this.$confirm('是否确认删除编号为"' + Ids + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(function () {
          return delUserInfo({ ids: Ids });
        })
        .then((response) => {
          if (response.code === 200) {
            this.msgSuccess(response.msg);
            this.open = false;
            this.getList();
          } else {
            this.msgError(response.msg);
          }
        })
        .catch(function () {});
    },
  },
};
</script>
