using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iWebOffice.ocx.c.net;
using System.Data.SqlClient;
using System.Data;
using System.Text.RegularExpressions;
using Supermore;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using System.IO;
using Supermore.Files;
using Youyou.Files;

namespace WebClient.apps.files
{
    public partial class officeServer : System.Web.UI.Page
    {
        private int mFileSize;
        private byte[] mFileBody;
        private string mFileName;
        private string mFileType;
        private string mFileDate;
        private string mFileID;
        private string mRecordID;
        private string mTemplate;
        private string mDateTime;
        private string mOption;
        private string mMarkName;
        private string mPassword;
        private string mMarkList;
        private string mBookmark;
        private string mDescript;
        private string mHostName;
        private string mMarkGuid;
        private string mDirectory;

        private string mHtmlName;
        private string mFilePath;

        private string mUserName;
        private string mCommand;
        private string mContent;

        private string mLabelName;
        private string mImageName;
        private string mTableContent;
        private int mColumns;
        private int mCells;
        private string mLocalFile;
        private string mRemoteFile;

        private string mFieldName;
        private string mFieldValue;
        private string mError;

        //打印控制
        private string mOfficePrints;
        private int mCopies;

        //自定义信息传递
        private string mInfo;

        string _objectTypeCode = "";//正文、附件、文件管理
        string _fileSource = "";

        private DBstep.iMsgServer2000 MsgObj;
        private iDBManage2000 DBAobj;

        string orgId = "";
        CallContext _caller  = null;
        private string customerCode = "";//客户代码

        protected void Page_Load(object sender, System.EventArgs e)
        {
            orgId = Request["OrganizationId"];
            // 在此处放置用户代码以初始化页面
            _caller = AppDataSource.GetCallContext();
            if (!string.IsNullOrEmpty(orgId))
            {
                if (_caller.CustomerID.ToLower() != orgId.ToLower())
                {
                    _caller = AppDataSource.GetCallerByCustomerId(new Guid(orgId));
                }
            }
            else
            {
                orgId = _caller.CustomerID;
            }
            if (_caller == null)
            {
                _caller = AppDataSource.GetCallerByCustomerId(new Guid(orgId));
                WebContext.SetCallContext(_caller, false);
            }
            customerCode = _caller.CustomerCode;

            DBAobj = new iDBManage2000(_caller);
            DBAobj.Open();
            MsgObj = new DBstep.iMsgServer2000();
            //mFilePath = Server.MapPath(".");
            mFilePath = Server.MapPath("/SysFiles");
            mTableContent = "";
            mColumns = 3;
            mCells = 8;

            //MsgObj.MsgVariant(Request.BinaryRead(Request.ContentLength));                     //老版本后台类，不支持UTF-8编码自适应功能
            MsgObj.Load(Request);                                                               //8.1.0.2版后台类新增解析接口，可支持UTF-8编码自适应功能

            //判断是否是合法的信息包，或者数据包信息是否完整
            if (MsgObj.GetMsgByName("DBSTEP").Equals("DBSTEP"))
            {
                mOption = MsgObj.GetMsgByName("OPTION");                                          //取得操作信息
                mUserName = MsgObj.GetMsgByName("USERNAME");									  //取得操作用户名称

                //下面的代码为打开服务器数据库里的文件
                if (mOption.Equals("LOADFILE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		                              //取得文档编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");	                                  //取得文档名称
                    mFileType = MsgObj.GetMsgByName("FILETYPE");	                                  //取得文档类型
                    MsgObj.MsgTextClear();                                                          //清除文本信息
                    //if (MsgObj.MsgFileLoad(mFilePath+"\\"+mFileName))						      //从文件夹调入文档
                    //从数据库调入文档
                    if (LoadFile())
                    {
                        MsgObj.MsgFileBody(mFileBody);				                                  //将文件信息打包
                        MsgObj.SetMsgByName("STATUS", "打开成功!.");		                          //设置状态信息
                        MsgObj.MsgError("");		                                                  //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("打开失败!");		                                          //设置错误信息
                    }
                }

                //下面的代码为保存文件在服务器的数据库里
                else if (mOption.Equals("SAVEFILE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		                              //取得文档编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");		                              //取得文档名称
                    mFileType = MsgObj.GetMsgByName("FILETYPE");		                              //取得文档类型
                    mUserName = MsgObj.GetMsgByName("USERNAME");                                      //取得保存用户名称
                    mFileSize = MsgObj.MsgFileSize();					                              //取得文档大小
                    mFileDate = DBAobj.GetDateTime();                                               //取得文档时间
                    mFileBody = MsgObj.MsgFileBody();					                              //取得文档内容
                    mDescript = "通用版本";                                                         //版本说明

                    _fileSource = MsgObj.GetMsgByName("fileSource");					    //取得客户端文件类型 正文，附件，文件管理
                    _objectTypeCode = MsgObj.GetMsgByName("objectTypeCode");   

                    string isEmpty = MsgObj.GetMsgByName("EMPTY");                      //是否是空内容文档的标识
                    if (isEmpty.Equals("TRUE"))
                    {
                        //此时接收的文档中内容是空白的，请用日志记录保存时间、保存用户、记录编号等信息，用于将来发现文档内容丢失时排查用。
                    }

                    MsgObj.MsgTextClear();                                                          //清除文本信息
                    //if (MsgObj.MsgFileSave(mFilePath+"\\"+mFileName))						      //保存文档内容到文件夹中
                    //保存文档内容到数据库中
                    if (SaveFile())
                    {
                        MsgObj.SetMsgByName("STATUS", "保存成功!");	                                  //设置状态信息
                        MsgObj.MsgError("");						                                  //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存失败!");		                                          //设置错误信息
                    }
                    MsgObj.MsgFileClear();
                }

                //下面的代码为打开服务器数据库里的模板文件
                else if (mOption.Equals("LOADTEMPLATE"))
                {
                    mTemplate = MsgObj.GetMsgByName("TEMPLATE");		                              //取得模板文档类型
                    //本段处理是否调用文档时打开模版，还是套用模版时打开模版。
                    mCommand = MsgObj.GetMsgByName("COMMAND");                                      //取得客户端定义的变量COMMAND值
                    if (mCommand.Equals("INSERTFILE"))
                    {
                        MsgObj.MsgTextClear();                                                        //清除文本信息
                        //从文件夹调入模板文档
                        if (MsgObj.MsgFileLoad(mFilePath + "\\Document\\" + mTemplate))
                        {
                            MsgObj.SetMsgByName("STATUS", "打开模板成功!");		                      //设置状态信息
                            MsgObj.MsgError("");		                                                  //清除错误信息
                        }
                        else
                        {
                            MsgObj.MsgError("打开模板失败!");		                                      //设置错误信息
                        }
                    }
                    else
                    {
                        MsgObj.MsgTextClear();
                        //从数据库调入模板文档
                        if (LoadTemplate())
                        {
                            MsgObj.MsgFileBody(mFileBody);				                              //将文件信息打包
                            MsgObj.SetMsgByName("STATUS", "打开模板成功!");		                      //设置状态信息
                            MsgObj.MsgError("");		                                                  //清除错误信息
                        }
                        else
                        {
                            MsgObj.MsgError("打开模板失败!");		                                      //设置错误信息
                        }
                    }
                }

                //下面的代码为保存模板文件在服务器的数据库里
                else if (mOption.Equals("SAVETEMPLATE"))
                {
                    mTemplate = MsgObj.GetMsgByName("TEMPLATE");		                              //取得文档编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");		                              //取得文档名称
                    mFileType = MsgObj.GetMsgByName("FILETYPE");		                              //取得文档类型
                    mUserName = MsgObj.GetMsgByName("USERNAME");                                    //取得保存用户名称
                    mFileSize = MsgObj.MsgFileSize();					                              //取得文档大小
                    mFileDate = DBAobj.GetDateTime();                                               //取得文档时间
                    mFileBody = MsgObj.MsgFileBody();					                              //取得文档内容
                    mDescript = "通用模板";                                                         //版本说明
                    MsgObj.MsgTextClear();                                                          //清除文本信息
                    //保存模板内容到数据库中
                    if (SaveTemplate())
                    {
                        MsgObj.SetMsgByName("STATUS", "保存模板成功!");		                          //设置状态信息
                        MsgObj.MsgError("");						                                  //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存模板失败!");					                          //设置错误信息
                    }
                    MsgObj.MsgFileClear();                                                          //清除文档内容
                }

                //下面的代码为打开版本列表
                else if (mOption.Equals("LISTVERSION"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		                              //取得文档编号
                    mUserName = MsgObj.GetMsgByName("USERNAME");                                    //取得保存用户名称
                    MsgObj.MsgTextClear();                                                          //清除文本信息
                    //生成版本列表
                    if (ListVersion())
                    {
                        MsgObj.SetMsgByName("FILEID", mFileID);		                                  //将文档号列表打包
                        MsgObj.SetMsgByName("DATETIME", mDateTime);	                                  //将日期时间列表打包
                        MsgObj.SetMsgByName("USERNAME", mUserName);	                                  //将用户名列表打包
                        MsgObj.SetMsgByName("DESCRIPT", mDescript);	                                  //将说明信息列表打包
                        MsgObj.SetMsgByName("STATUS", "版本列表成功!");	                              //设置状态信息
                        MsgObj.MsgError("");				                                          //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("版本列表失败!");			                                  //设置错误信息
                    }
                }

                //下面的代码为打开版本文档
                else if (mOption.Equals("LOADVERSION"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		                              //取得文档编号
                    mFileID = MsgObj.GetMsgByName("FILEID");		                                  //取得版本文档号
                    MsgObj.MsgTextClear();                                                          //清除文本信息
                    //调入该版本文档
                    if (LoadVersion(mFileID))
                    {
                        MsgObj.MsgFileBody(mFileBody);		                                          //将文档信息打包
                        MsgObj.SetMsgByName("STATUS", "打开版本成功!");                               //设置状态信息
                        MsgObj.MsgError("");			                                              //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("打开版本失败!");			                                  //设置错误信息
                    }
                }

                //下面的代码为保存版本文档
                else if (mOption.Equals("SAVEVERSION"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		                       //取得文档编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");		                       //取得文档名称
                    mFileType = MsgObj.GetMsgByName("FILETYPE");		                       //取得文档类型
                    mUserName = MsgObj.GetMsgByName("USERNAME");                             //取得保存用户名称
                    mDescript = MsgObj.GetMsgByName("DESCRIPT");		                       //取得说明信息
                    mFileSize = MsgObj.MsgFileSize();			                               //取得文档大小
                    mFileDate = DBAobj.GetDateTime();                                        //取得文档时间
                    mFileBody = MsgObj.MsgFileBody();			                               //取得文档内容
                    MsgObj.MsgTextClear();
                    //保存版本文档
                    if (SaveVersion())
                    {
                        MsgObj.SetMsgByName("STATUS", "保存版本成功!");	                   //设置状态信息
                        MsgObj.MsgError("");				                               //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存版本失败!");		                           //设置错误信息
                    }
                    MsgObj.MsgFileClear();				                                   //清除文档内容
                }

                //下面的代码为取得文档标签
                else if (mOption.Equals("LOADBOOKMARKS"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		                      //取得文档编号
                    mTemplate = MsgObj.GetMsgByName("TEMPLATE");		                      //取得模板编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");		                      //取得文档名称
                    mFileType = MsgObj.GetMsgByName("FILETYPE");		                      //取得文档类型
                    MsgObj.MsgTextClear();
                    if (LoadBookMarks())
                    {
                        MsgObj.MsgError("");				                             //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("打开标签信息失败!");		                    //设置错误信息
                    }
                }

                //下面的代码为取得标签文档内容
                else if (mOption.Equals("SAVEBOOKMARKS"))
                {
                    mTemplate = MsgObj.GetMsgByName("TEMPLATE");		                   //取得模板编号
                    if (SaveBookMarks())
                    {
                        MsgObj.MsgError("");			                               //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存标签信息失败!");	                       //设置错误信息
                    }
                    MsgObj.MsgTextClear();
                }

                //下面的代码为显示标签列表
                else if (mOption.Equals("LISTBOOKMARKS"))
                {
                    MsgObj.MsgTextClear();                                            //清除文本信息
                    if (ListBookmarks())
                    {
                        MsgObj.SetMsgByName("BOOKMARK", mBookmark);	                  //将用户名列表打包
                        MsgObj.SetMsgByName("DESCRIPT", mDescript);	                  //将说明信息列表打包
                        MsgObj.MsgError("");			                              //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("调入标签失败!");			                  //设置错误信息
                    }
                }

                //下面的代码为创建印章列表
                else if (mOption.Equals("LOADMARKLIST"))
                {
                    MsgObj.MsgTextClear();                                            //清除文本信息
                    if (LoadMarkList())
                    {
                        MsgObj.SetMsgByName("MARKLIST", mMarkList);                    //显示签章列表
                        MsgObj.MsgError("");				                          //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("创建印章列表失败!");			              //设置错误信息
                    }
                }

                //下面的代码为打开印章文件
                else if (mOption.Equals("LOADMARKIMAGE"))
                {
                    mMarkName = MsgObj.GetMsgByName("IMAGENAME");	                     //取得签名名称
                    mUserName = MsgObj.GetMsgByName("USERNAME");		                 //取得用户名称
                    mPassword = MsgObj.GetMsgByName("PASSWORD");		                 //取得用户密码
                    mFileType = ".jpg";                                                //默认为.jpg类型
                    MsgObj.MsgTextClear();
                    //调入签名信息
                    if (LoadMarkImage(mMarkName, mPassword))
                    {
                        MsgObj.SetMsgByName("IMAGETYPE", mFileType);                  //设置签名类型
                        MsgObj.MsgFileBody(mFileBody);			                     //将文件信息打包
                        MsgObj.SetMsgByName("STATUS", "打开成功!");  	             //设置状态信息
                        MsgObj.MsgError("");				                         //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("签名或密码错误!");		                     //设置错误信息
                    }
                }

                //下面的代码为保存签章基本信息
                else if (mOption.Equals("SAVESIGNATURE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		                //取得文档编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");		                //取得标签文档内容
                    mMarkName = MsgObj.GetMsgByName("MARKNAME");		                //取得签名名称
                    mUserName = MsgObj.GetMsgByName("USERNAME");		                //取得用户名称
                    mDateTime = MsgObj.GetMsgByName("DATETIME");		                //取得签名时间
                    mHostName = Request.ServerVariables["REMOTE_ADDR"].ToString();    //取得用户IP
                    mMarkGuid = MsgObj.GetMsgByName("MARKGUID");                      //取得唯一编号
                    MsgObj.MsgTextClear();                                          //清除文本信息
                    //保存签章基本信息
                    if (SaveSignature())
                    {
                        MsgObj.SetMsgByName("STATUS", "保存成功!");  	            //设置状态信息
                        MsgObj.MsgError("");				                        //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存印章失败!");		                    //设置错误信息
                    }
                }

                //下面的代码为调出签章基本信息
                else if (mOption.Equals("LOADSIGNATURE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		               //取得文档编号
                    MsgObj.MsgTextClear();                                         //清除文本信息
                    //调出签章基本信息
                    if (LoadSignature())
                    {
                        MsgObj.SetMsgByName("MARKNAME", mMarkName);                 //将签名名称列表打包
                        MsgObj.SetMsgByName("USERNAME", mUserName);                 //将用户名列表打包
                        MsgObj.SetMsgByName("DATETIME", mDateTime);                 //将时间列表打包
                        MsgObj.SetMsgByName("HOSTNAME", mHostName);                 //将说明信息列表打包
                        MsgObj.SetMsgByName("MARKGUID", mMarkGuid);
                        MsgObj.SetMsgByName("STATUS", "调入成功!");  	           //设置状态信息
                        MsgObj.MsgError("");				                       //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("调入印章失败!");		                   //设置错误信息
                    }
                }

                //下面的代码为存为HTML页面
                else if (mOption.Equals("SAVEASHTML"))
                {
                    mHtmlName = MsgObj.GetMsgByName("HTMLNAME");		               //取得标签文档内容
                    mDirectory = MsgObj.GetMsgByName("DIRECTORY");	               //取得标签文档内容
                    MsgObj.MsgTextClear();
                    if (mDirectory.Equals(""))
                    {
                        mFilePath = mFilePath + "\\HTML";
                    }
                    else
                    {
                        mFilePath = mFilePath + "\\HTML\\" + mDirectory;
                    }
                    MsgObj.MakeDirectory(mFilePath);							   //创建路径
                    string htmlPath = mFilePath + "\\" + mHtmlName;
                    if (File.Exists(htmlPath))
                    {
                        File.Delete(htmlPath);
                    }
                    if (MsgObj.MsgFileSave(htmlPath))
                    {
                        //Supermore.Diagnostics.Trace.LogError("save html template:" + htmlPath);
                        MsgObj.MsgError("");                                       //清除错误信息
                        MsgObj.SetMsgByName("STATUS", "保存成功");                  //设置状态信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存失败");                               //设置错误信息
                    }
                    MsgObj.MsgFileClear();
                }

                //下面的代码为存为HTML图片页面
                else if (mOption.Equals("SAVEIMAGE"))
                {
                    mFileName = MsgObj.GetMsgByName("HTMLNAME");	                  //取得文件名称
                    mDirectory = MsgObj.GetMsgByName("DIRECTORY");                  //取得目录名称
                    MsgObj.MsgTextClear();				                          //清除文本信息
                    if (mDirectory.Equals(""))
                    {
                        mFilePath = mFilePath + "\\HTMLIMAGE";
                    }
                    else
                    {
                        mFilePath = mFilePath + "\\HTMLIMAGE\\" + mDirectory;
                    }
                    MsgObj.MakeDirectory(mFilePath);                              //创建路径
                    if (MsgObj.MsgFileSave(mFilePath + "\\" + mFileName))             //保存HTML图片文件
                    {
                        MsgObj.MsgError("");				                      //清除错误信息
                        MsgObj.SetMsgByName("STATUS", "保存HTML图片成功!");	      //设置状态信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存HTML图片失败!");			          //设置错误信息
                    }
                    MsgObj.MsgFileClear();				                          //清除文档内容
                }

                //下面的代码为存为HTML图片页面
                else if (mOption.Equals("SAVEASPAGE"))
                {
                    mHtmlName = MsgObj.GetMsgByName("HTMLNAME");	                  //取得文件名称
                    mDirectory = MsgObj.GetMsgByName("DIRECTORY");                  //取得目录名称
                    MsgObj.MsgTextClear();				                          //清除文本信息
                    if (mDirectory.Equals(""))
                    {
                        mFilePath = mFilePath + "\\HTML";
                    }
                    else
                    {
                        mFilePath = mFilePath + "\\HTML\\" + mDirectory;
                    }
                    MsgObj.MakeDirectory(mFilePath);                              //创建路径
                    //保存HTML图片文件
                    if (MsgObj.MsgFileSave(mFilePath + "\\" + mHtmlName))
                    {
                        MsgObj.MsgError("");				                      //清除错误信息
                        MsgObj.SetMsgByName("STATUS", "保存批注HTML图片成功!");	      //设置状态信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存批注HTML图片失败!");			          //设置错误信息
                    }
                    MsgObj.MsgFileClear();				                          //清除文档内容
                }

                //下面的代码为插入文件
                else if (mOption.Equals("INSERTFILE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");				      //取得文档编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");			          //取得文档名称
                    mFileType = MsgObj.GetMsgByName("FILETYPE");			          //取得文档类型

                    string fieldName = MsgObj.GetMsgByName("FIELDNAME");
                    string fieldID = MsgObj.GetMsgByName("FIELDID");


                    MsgObj.MsgTextClear();                                        //清除文本信息
                    //调入文档
                    //if (LoadFile())
                    
                    if (MsgObj.MsgFileLoad(mFilePath + "\\field.htm"))
                    {                       

                       // MsgObj.MsgFileBody(mFileBody);						      //将文件信息打包
                        MsgObj.SetMsgByName("POSITION", "Content");			      //设置插入的位置[书签] 
                        MsgObj.SetMsgByName("STATUS", "插入文件成功!.");			  //设置状态信息
                        MsgObj.MsgError("");								      //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("插入文件失败!");						 //设置错误信息
                    }
                }               
                //下面的代码为更新保存文件
                else if (mOption.Equals("UPDATEFILE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");				     //取得文档编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");				     //取得文档名称
                    mFileType = MsgObj.GetMsgByName("FILETYPE");				     //取得文档类型
                    mUserName = MsgObj.GetMsgByName("USERNAME");				     //取得保存用户名称
                    mDescript = "定稿版本";									     //定稿版本说明
                    mFileSize = MsgObj.MsgFileSize();							     //取得文档大小
                    mFileDate = DBAobj.GetDateTime();							     //取得文档时间
                    mFileBody = MsgObj.MsgFileBody();							     //取得文档内容
                    MsgObj.MsgTextClear();
                    //保存版本文档 也可以根据实际需要,保存到其他数据库中
                    if (SaveVersion())
                    {
                        MsgObj.SetMsgByName("STATUS", "保存版本成功!");		     //设置状态信息
                        MsgObj.MsgError("");								     //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存版本失败!");					     //设置错误信息
                    }
                    MsgObj.MsgFileClear();                                       //清除文档内容
                }

                //下面的代码为插入服务器图片
                else if (mOption.Equals("INSERTIMAGE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		             //取得文档编号
                    mLabelName = MsgObj.GetMsgByName("LABELNAME");                 //标签名
                    mImageName = MsgObj.GetMsgByName("IMAGENAME");                 //图片名
                    mFilePath = mFilePath + "\\Document\\" + mImageName;               //图片在服务器的完整路径
                    mFileType = mImageName.Substring(mImageName.Length - 4, 4).ToLower();  //取得文件的类型
                    MsgObj.MsgTextClear();
                    //调入图片
                    if (MsgObj.MsgFileLoad(mFilePath))
                    {
                        MsgObj.SetMsgByName("IMAGETYPE", mFileType);		         //指定图片的类型 
                        MsgObj.SetMsgByName("POSITION", mLabelName);		         //设置插入的位置[书签对象名] 
                        MsgObj.SetMsgByName("STATUS", "插入图片成功!");           //设置状态信息
                        MsgObj.MsgError("");		                             //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("插入图片失败!");			             //设置错误信息
                    }
                }

                //下面的代码为请求上传文件操作
                else if (mOption.Equals("PUTFILE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");                   //取得文档编号
                    mLocalFile = MsgObj.GetMsgByName("LOCALFILE");                 //取得 本地文件名称
                    mRemoteFile = MsgObj.GetMsgByName("REMOTEFILE");               //取得远程文件名称
                    mFilePath = mFilePath + "\\Document\\" + mRemoteFile;              //上传文件在服务器的完整路径
                    mFileBody = MsgObj.MsgFileBody();                               //取得文档内容
                    MsgObj.MsgTextClear();                                       //清除文本信息
                    //保存文档内容
                    if (MsgObj.MsgFileSave(mFilePath))
                    {
                        MsgObj.SetMsgByName("STATUS", "保存上传文件成功!");       //设置状态信息
                        MsgObj.MsgError("");                                     //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存上传文件失败!");                    //设置错误信息
                    }
                    MsgObj.MsgFileClear();                                       //清除文档内容
                }

                //下面的代码为请求下载文件操作
                else if (mOption.Equals("GETFILE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");		    //取得文档编号
                    mLocalFile = MsgObj.GetMsgByName("LOCALFILE");		    //取得本地文件名称
                    mRemoteFile = MsgObj.GetMsgByName("REMOTEFILE");	    //取得远程文件名称
                    MsgObj.MsgTextClear();				    //清除文本信息
                    mFilePath = mFilePath + "\\Document\\" + mRemoteFile;
                    //调入文档内容
                    if (MsgObj.MsgFileLoad(mFilePath))
                    {
                        MsgObj.SetMsgByName("STATUS", "保存下载文件成功!");       //设置状态信息
                        MsgObj.MsgError("");		                    //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("下载文件失败!");			    //设置错误信息
                    }
                }

                //下面的代码为请求取得服务器时间
                else if (mOption.Equals("DATETIME"))
                {
                    MsgObj.MsgTextClear();				    //清除文本信息
                    MsgObj.SetMsgByName("DATETIME", DBAobj.GetDateTime());       //标准日期格式字串，如 2005-8-16 10:20:35
                    MsgObj.MsgError("");		                    //清除错误信息
                }

                //下面的代码为Web页面请求信息[扩展接口]
                else if (mOption.Equals("SENDMESSAGE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");					//取得文档编号
                    mFileName = MsgObj.GetMsgByName("FILENAME");					//取得文档名称
                    mFileType = MsgObj.GetMsgByName("FILETYPE");					//取得文档类型
                    mCommand = MsgObj.GetMsgByName("COMMAND");					//取得操作类型 InportText or ExportText
                    mContent = MsgObj.GetMsgByName("CONTENT");					//取得文本信息 Content
                    mOfficePrints = MsgObj.GetMsgByName("OFFICEPRINTS");			//取得Office文档的打印次数
                    mInfo = MsgObj.GetMsgByName("TESTINFO");					    //取得客户端传来的自定义信息
                    mFieldName = MsgObj.GetMsgByName("FIELDNAME");                //取得域的代码字符串

                    var fieldID = MsgObj.GetMsgByName("FIELDID");
                    var fieldName = MsgObj.GetMsgByName("FIELDNAME");                    
                    var tableID = MsgObj.GetMsgByName("TABLEID");

                    MsgObj.MsgTextClear();
                    #region commands
                    if (mCommand.Equals("WEBFIELD"))
                    {
                        /*mFieldName就等于CCWordApp.cs文件内ReplaceTag函数中的sheep
                         * mFieldValue：域的值。等于CCWordApp.cs文件内ReplaceTag函数中val
                         * 
                         * */
                        MsgObj.SetMsgByName("FIELDNAME", mFieldValue);
                    }
                    else if (mCommand.Equals("INPORTTEXT"))
                    {
                        if (LoadContent())
                        {
                            MsgObj.SetMsgByName("CONTENT", mContent);
                            MsgObj.SetMsgByName("STATUS", "导入成功!");	                        //设置状态信息
                            MsgObj.MsgError("");						                            //清除错误信息
                        }
                        else
                        {
                            MsgObj.MsgError("导入失败!");				                            //设置错误信息
                        }
                    }
                    else if (mCommand.Equals("EXPORTTEXT"))
                    {
                        if (SaveContent())
                        {
                            MsgObj.SetMsgByName("STATUS", "导出成功!");	                        //设置状态信息
                            MsgObj.MsgError("");						                            //清除错误信息
                        }
                        else
                        {
                            MsgObj.MsgError("导出失败!");				                            //设置错误信息
                        }
                    }
                    else if (mCommand.Equals("WORDTABLE"))
                    {
                        if (GetWordTable())
                        {
                            MsgObj.SetMsgByName("COLUMNS", mColumns.ToString());                  //列
                            MsgObj.SetMsgByName("CELLS", mCells.ToString());                      //行
                            MsgObj.SetMsgByName("WORDCONTENT", mTableContent);                    //表格内容
                            MsgObj.SetMsgByName("STATUS", "增加和填充成功成功!");                 //设置状态信息
                            MsgObj.MsgError("");                                                  //清除错误信息
                        }
                        else
                        {
                            MsgObj.MsgError("增加表格行失败!");                                   //设置错误信息
                        }
                    }
                    else if (mCommand.Equals("COPIES"))
                    {
                        mCopies = Convert.ToInt16(mOfficePrints);
                        if (mCopies <= 2)
                        {
                            if (UpdataCopies(2 - mCopies))
                            {
                                MsgObj.SetMsgByName("STATUS", "1");
                                MsgObj.MsgError("");
                            }
                        }
                        else
                        {
                            MsgObj.SetMsgByName("STATUS", "0");
                            MsgObj.MsgError("");
                        }
                    }
                    else if (mCommand.Equals("SELFINFO"))
                    {
                        mInfo = "服务器端收到客户端传来的信息：“" + mInfo + "” | ";
                        mInfo = mInfo + "服务器端发回当前服务器时间：" + DBAobj.GetDateTime();  //组合返回给客户端的信息
                        MsgObj.SetMsgByName("RETURNINFO", mInfo);                               //将返回的信息设置到信息包中
                    }
                    else if (mCommand.Equals("CREATEHTML")) //插入HTML
                    {

                        if (CreateFieldHtml(tableID,fieldID,fieldName))
                        {
                            MsgObj.SetMsgByName("STATUS", "生成HTML成功!");
                            MsgObj.MsgError("");
                        }
                        else
                        {
                            MsgObj.MsgError("生成文件失败!");   
                        }
                    }
                    else
                    {
                        MsgObj.MsgError("客户端Web发送数据包命令没有合适的处理函数![" + mCommand + "]");
                        MsgObj.MsgTextClear();
                        MsgObj.MsgFileClear();
                    }
                    #endregion
                }

                //下面的代码为保存为全文批注格式文件
                else if (mOption.Equals("SAVEPAGE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");                      //取得文档编号
                    mFilePath = mFilePath + "\\Document\\" + mRecordID + ".pgf";          //全文批注文件的完整路径
                    MsgObj.MsgTextClear();                                          //清除文体信息
                    //保存全文批注文件
                    if (MsgObj.MsgFileSave(mFilePath))
                    {
                        MsgObj.SetMsgByName("STATUS", "保存全文批注成功!");                  //设置状态信息
                        MsgObj.MsgError("");                                        //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("保存全文批注失败!");                       //设置错误信息
                    }
                    MsgObj.MsgFileClear();                                           //清除文本信息
                }
                //下面的代码为调入全文批注格式文件
                else if (mOption.Equals("LOADPAGE"))
                {
                    mRecordID = MsgObj.GetMsgByName("RECORDID");                       //取得文档编号
                    mFilePath = mFilePath + "\\Document\\" + mRecordID + ".pgf";          //全文批注文件的完整路径
                    MsgObj.MsgTextClear();                                           //清除文本信息
                    if (MsgObj.MsgFileLoad(mFilePath))                                //调入全文批注文件
                    {
                        MsgObj.SetMsgByName("STATUS", "打开全文批注成功!");                   //设置状态信息
                        MsgObj.MsgError("");                                         //清除错误信息
                    }
                    else
                    {
                        MsgObj.MsgError("打开全文批注失败!");                         //设置状态信息
                    }
                }
                else
                {
                    MsgObj.MsgError("Error:packet message");
                    MsgObj.MsgTextClear();
                    MsgObj.MsgFileClear();
                }
            }
            else
            {
                MsgObj.MsgError("Error:packet message");
                MsgObj.MsgTextClear();
                MsgObj.MsgFileClear();
            }

            //Response.BinaryWrite(MsgObj.MsgVariant());                          //老版后台类返回信息包数据方法
            MsgObj.Send(Response);                                                //8.1.0.2新版后台类新增的功能接口，返回信息包数据

            DBAobj.Close();
        }

        #region 模板
        //
        // 文档、模板管理代码    开始  *******************************
        //

        //调出模板文档，将模板文档内容保存在mFileBody里，以便进行打包
        private bool LoadTemplate()
        {
            bool mResult = false;
            string strSelectCmd = "SELECT FileBody FROM Template_File WHERE RecordID='" + mTemplate + "'";
            SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
            SqlDataReader mReader = mCommand.ExecuteReader();
            if (mReader.Read())
            {
                mFileBody = mReader.GetSqlBinary(0).Value;
                mResult = true;
            }
            else
            {
                mResult = false;
            }
            mReader.Close();
            return (mResult);
        }
        //保存模板文档，如果模板文档存在，则覆盖，不存在，则添加
        private bool SaveTemplate()
        {
            bool mResult = false;

            SqlCommand nCommand;
            string strUpdateCmd;
            string strInsertCmd;

            string strSelectCmd = "SELECT * FROM Template_File WHERE RecordID='" + mTemplate + "'";
            SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
            SqlDataReader mReader = mCommand.ExecuteReader();
            bool isUpdated = false;
            if (mReader.Read())
            {
                strUpdateCmd = @"UPDATE Template_File set RecordID=@RecordID,Name=@Name,FileName=@FileName,FileType=@FileType,FileSize=@FileSize,FileDate=@FileDate,FileBody=@FileBody,FilePath=@FilePath,UserName=@UserName,Descript=@Descript 
                                    ,ModifiedBy=@ModifiedBy,ModifiedOn = Getdate()
                                    WHERE RecordID='" + mTemplate + "'";
                nCommand = new SqlCommand(strUpdateCmd, DBAobj.Connection);
                isUpdated = true;
            }
            else
            {
                strInsertCmd = @"INSERT INTO Template_File (RecordID,Name,FileName,FileType,FileSize,FileDate,FileBody,FilePath,UserName,Descript,CreatedBy,OwningBusinessUnit,OrganizationId) 
                                values (@RecordID,@Name,@FileName,@FileType,@FileSize,@FileDate,@FileBody,@FilePath,@UserName,@Descript,@CreatedBy,@OwningBusinessUnit,@OrganizationId)";
                nCommand = new SqlCommand(strInsertCmd, DBAobj.Connection);
            }
            mReader.Close();
            try
            {
                nCommand.Parameters.Add(new SqlParameter("@RecordID", SqlDbType.VarChar, 36));
                nCommand.Parameters["@RecordID"].Value = mTemplate;

                nCommand.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar, 100));
                nCommand.Parameters["@Name"].Value = mFileName;

                nCommand.Parameters.Add(new SqlParameter("@FileName", SqlDbType.VarChar, 100));
                nCommand.Parameters["@FileName"].Value = mFileName;

                nCommand.Parameters.Add(new SqlParameter("@FileType", SqlDbType.VarChar, 10));
                nCommand.Parameters["@FileType"].Value = mFileType;

                nCommand.Parameters.Add(new SqlParameter("@FileSize", SqlDbType.BigInt));
                nCommand.Parameters["@FileSize"].Value = mFileSize;

                nCommand.Parameters.Add(new SqlParameter("@FileDate", SqlDbType.DateTime));
                nCommand.Parameters["@FileDate"].Value = mFileDate;

                nCommand.Parameters.Add(new SqlParameter("@FileBody", SqlDbType.Image));
                nCommand.Parameters["@FileBody"].Value = mFileBody;

                nCommand.Parameters.Add(new SqlParameter("@FilePath", SqlDbType.VarChar, 100));
                nCommand.Parameters["@FilePath"].Value = mFilePath;

                nCommand.Parameters.Add(new SqlParameter("@UserName", SqlDbType.VarChar, 50));
                nCommand.Parameters["@UserName"].Value = mUserName;

                nCommand.Parameters.Add(new SqlParameter("@Descript", SqlDbType.VarChar, 100));
                nCommand.Parameters["@Descript"].Value = mDescript;
                if (isUpdated)
                {
                    nCommand.Parameters.Add(new SqlParameter("@ModifiedBy", SqlDbType.UniqueIdentifier));
                    nCommand.Parameters["@ModifiedBy"].Value = new Guid(this._caller.UserID);
                }
                else
                {
                    nCommand.Parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.UniqueIdentifier));
                    nCommand.Parameters["@CreatedBy"].Value =new Guid(this._caller.UserID);

                    nCommand.Parameters.Add(new SqlParameter("@OwningBusinessUnit", SqlDbType.UniqueIdentifier));
                    nCommand.Parameters["@OwningBusinessUnit"].Value =this._caller.BussinessUnitId;

                    nCommand.Parameters.Add(new SqlParameter("@OrganizationId", SqlDbType.UniqueIdentifier));
                    nCommand.Parameters["@OrganizationId"].Value = new Guid(this._caller.CustomerID);
                }

                int iRes = nCommand.ExecuteNonQuery();
                if (iRes > 0)
                    mResult = true;
            }
            catch (SqlException ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                mError = ex.ToString();
                mResult = false;
            }
            return (mResult);
        }
        #endregion
        #region 存文件
        //保存文档，如果文档存在，则覆盖，不存在，则添加
        private bool SaveFile()
        {
            bool mResult = false;

            SqlCommand nCommand;
            string strUpdateCmd;
            string strInsertCmd;
            string rootPath = "";
            //附件、文件管理的修改保存不支持
            if (_fileSource == "1001") //附件
            {
                //存储附件路径
                rootPath = FileStorage.GetAttachRootPath(_caller);
                if (!string.IsNullOrEmpty(rootPath))
                {
                    rootPath = IOPaths.AttachFiles;
                }
            }
            if (_fileSource == "100100") //文件
            {
                //存储文件路径                   
                rootPath = FileStorage.GetFileRootPath(_caller);
                if (!string.IsNullOrEmpty(rootPath))
                {
                    rootPath = IOPaths.Files;
                }
            }

            string strSelectCmd = "SELECT * FROM Document_File WHERE RecordID='" + mRecordID + "'";
            SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
            SqlDataReader mReader = mCommand.ExecuteReader();
            if (mReader.Read())
            {
                strUpdateCmd = "update Document_File set RecordID=@RecordID,FileName=@FileName,FileType=@FileType,FileSize=@FileSize,FileDate=@FileDate,FileBody=@FileBody,FilePath=@FilePath,UserName=@UserName,Descript=@Descript WHERE RecordID='" + mRecordID + "'";
                nCommand = new SqlCommand(strUpdateCmd, DBAobj.Connection);
            }
            else
            {
                strInsertCmd = "insert into Document_File (RecordID,FileName,FileType,FileSize,FileDate,FileBody,FilePath,UserName,Descript) values (@RecordID,@FileName,@FileType,@FileSize,@FileDate,@FileBody,@FilePath,@UserName,@Descript)";
                nCommand = new SqlCommand(strInsertCmd, DBAobj.Connection);
            }
            mReader.Close();
            try
            {
                nCommand.Parameters.Add(new SqlParameter("@RecordID", SqlDbType.VarChar, 50));
                nCommand.Parameters["@RecordID"].Value = mRecordID;


                nCommand.Parameters.Add(new SqlParameter("@FileName", SqlDbType.VarChar, 64));
                nCommand.Parameters["@FileName"].Value = mFileName;


                nCommand.Parameters.Add(new SqlParameter("@FileType", SqlDbType.VarChar, 4));
                nCommand.Parameters["@FileType"].Value = mFileType;


                nCommand.Parameters.Add(new SqlParameter("@FileSize", SqlDbType.Int));
                nCommand.Parameters["@FileSize"].Value = mFileSize;


                nCommand.Parameters.Add(new SqlParameter("@FileDate", SqlDbType.DateTime));
                nCommand.Parameters["@FileDate"].Value = mFileDate;


                nCommand.Parameters.Add(new SqlParameter("@FileBody", SqlDbType.Image));
                nCommand.Parameters["@FileBody"].Value = mFileBody;


                nCommand.Parameters.Add(new SqlParameter("@FilePath", SqlDbType.VarChar, 64));
                nCommand.Parameters["@FilePath"].Value = mFilePath;


                nCommand.Parameters.Add(new SqlParameter("@UserName", SqlDbType.VarChar, 32));
                nCommand.Parameters["@UserName"].Value = mUserName;


                nCommand.Parameters.Add(new SqlParameter("@Descript", SqlDbType.VarChar, 64));
                nCommand.Parameters["@Descript"].Value = mDescript;
                nCommand.ExecuteNonQuery();
                mResult = true;

                //保存附件             
                if (mResult)
                {
                    if (_fileSource == "1001")
                    {
                        Entity entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.RelatedAttachment, new Guid(mRecordID));
                        if (entity != null && entity.Fields["FileLocation"].Value != null)
                        {
                            string fileLocation = StringUtil.GetString(entity.Fields["FileLocation"].Value).Replace("/", "\\");

                            var isSave = MsgObj.MsgFileSave(rootPath + fileLocation);
                        }
                    }
                    else if (_fileSource == "100100")
                    {
                        Entity entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.File, new Guid(mRecordID));
                        if (entity != null && entity.Fields["VirtualPath"].Value != null)
                        {
                            string fileLocation = StringUtil.GetString(entity.Fields["VirtualPath"].Value).Replace("/", "\\");

                            var isSave = MsgObj.MsgFileSave(rootPath + fileLocation);
                        }
                    }
                }
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                Supermore.Diagnostics.Trace.LogError(mError);
                mResult = false;
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                mResult = false;
            }
            return (mResult);
        }
        #endregion

        #region 取文件
        //调出文档，将文档内容保存在mFileBody里，以便进行打包
        private bool LoadFile()
        {
            bool mResult = false;
            string strSelectCmd = "SELECT FileBody FROM Document_File WHERE RecordID='" + mRecordID + "'";
            SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
            SqlDataReader mReader = mCommand.ExecuteReader();
            if (mReader.Read())
            {
                mFileBody = mReader.GetSqlBinary(0).Value;
                mResult = true;
            }
            else
            {
                return GetEntityAttach();
                //mResult = false;
            }
            mReader.Close();
            return (mResult);
        }
        /// <summary>
        /// 如果没有 在附件表里，可以 查物理路径
        /// </summary>
        bool GetEntityAttach()
        {

            string virtualPath = "";
            string realPath = "";
            string rootPath = "";
            string filePath = "";
            string fileName = "";
            string fileExtension = "";

            if (mRecordID.Length < 36)
                return false;
            Entity entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.RelatedAttachment, new Guid(mRecordID));
            if (entity != null)
            {
                rootPath = IOPaths.AttachFiles;
            }
            else if (entity == null && _fileSource == ObjectTypeCodes.MailAttach.ToString())
            {
                entity = EntityManager.GetEntity(_caller, ObjectTypeCodes.MailAttach, new Guid(mRecordID));
                if (entity != null)
                {
                    rootPath = IOPaths.EmailAttachFiles;
                }
            }
            else
            {
                return GetEntityFile();
            }

            if (entity != null)
            {
                virtualPath = StringUtil.GetString(entity.Fields["FileLocation"].Value);
                realPath = virtualPath.Replace("/", "\\");
                filePath = rootPath + realPath;
                fileName = StringUtil.GetString(entity.Fields["Name"].Value);
                fileExtension = StringUtil.GetString(entity.Fields["FileExtension"].Value);

                if (!string.IsNullOrEmpty(fileExtension))
                {
                    if (fileExtension.Substring(0, 1) != ".")
                    {
                        mFileType = "." + fileExtension;
                    }
                }
            }
            else
            {
                return false;
            }
            try
            {
                //byte[] buffer = new byte[1024];
                //int length = 0;
                if (File.Exists(filePath))
                {
                    using (FileStream fs = new FileStream(filePath, FileMode.Open))
                    {
                        mFileBody = new byte[fs.Length];
                        fs.Read(mFileBody, 0, mFileBody.Length);
                        fs.Seek(0, SeekOrigin.Begin);
                        //fs.Read(mFileBody, 0, fs.Length);
                        /*
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            //Response.OutputStream.Write(buffer, 0, length);
                            //Response.Flush();
                        }*/
                    }
                    return true;
                }
                else
                {
                    //Supermore.Diagnostics.Trace.LogError(file + " file donload failure.");
                    //Response.Write("文件不存在");
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                //Supermore.Diagnostics.Trace.LogError(file + " file donload failure.");
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            return false;
        }
        /// <summary>
        /// 取文件管理数据
        /// </summary>
        /// <returns></returns>
        bool GetEntityFile()
        {
            //Entity entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.RelatedAttachment, new Guid(mRecordID));
            if (mRecordID.Length < 36)
                return false;
            FileEntity entity = FileManager.GetFile(_caller, new Guid(mRecordID));
            string virtualPath = "";
            string realPath = "";
            string rootPath = "";
            string filePath = "";
            string fileName = "";
            string fileExtension = "";
            if (entity != null)
            {
                virtualPath = StringUtil.GetString(entity.VirtualPath);
                realPath = virtualPath.Replace("/", "\\");
                rootPath = IOPaths.Files;
                filePath = rootPath + realPath;
                fileName = StringUtil.GetString(entity.Name);
                fileExtension = entity.FileExtension;

                if (!string.IsNullOrEmpty(fileExtension))
                {
                    if (fileExtension.Substring(0, 1) != ".")
                    {
                        mFileType = "." + fileExtension;
                    }
                }
            }
            else
            {
                return false;
            }
            try
            {
                //byte[] buffer = new byte[1024];
                //int length = 0;
                if (File.Exists(filePath))
                {
                    using (FileStream fs = new FileStream(filePath, FileMode.Open))
                    {
                        mFileBody = new byte[fs.Length];
                        fs.Read(mFileBody, 0, mFileBody.Length);
                        fs.Seek(0, SeekOrigin.Begin);
                        //fs.Read(mFileBody, 0, fs.Length);
                        /*
                        while ((length = fs.Read(buffer, 0, buffer.Length)) > 0)
                        {
                            //Response.OutputStream.Write(buffer, 0, length);
                            //Response.Flush();
                        }*/
                    }
                    return true;
                }
                else
                {
                    Supermore.Diagnostics.Trace.LogError(filePath + " file donload failure.FileBase fileid:" + mRecordID);
                }
            }
            catch (Exception ex)
            {
                //Response.Write(ex.Message);
                //Supermore.Diagnostics.Trace.LogError(file + " file donload failure.");
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            return false;
        }
        
        #endregion
        
        private bool CreateFieldHtml(string tableId,string fieldId,string fieldName)
        {
            bool mResult = true;
            //mFilePath + "\\field.htm"
            string prefix = fieldId.Substring(0, 2);
            string objGuid = fieldId;
            if (prefix == "t:" || prefix == "t:")
            {
                objGuid = fieldId.Substring(2);
            }
            if (prefix == "t:")//插入子表
            {
                string fieldInfo = Supermore.IO.FileUtil.ReadFromFile(mFilePath + "\\SubFormTemplate.htm");
                fieldInfo = fieldInfo.Replace("{!FormId}", objGuid);
                fieldInfo = fieldInfo.Replace("{!FormName}", fieldName);
                Supermore.IO.FileUtil.WriteUTF8File(mFilePath + "\\field.htm", fieldInfo);
            }
            else
            {
                string fieldInfo = Supermore.IO.FileUtil.ReadFromFile(mFilePath + "\\FormFieldTemplate.htm");
                fieldInfo = fieldInfo.Replace("{!FieldId}", objGuid);
                fieldInfo = fieldInfo.Replace("{!FieldName}", fieldName);
                //fieldInfo = RenderControls("{!FieldId}", fieldInfo, objGuid);
                //fieldInfo = RenderControls("{!FieldName}", fieldInfo, fieldName);
                Supermore.IO.FileUtil.WriteUTF8File(mFilePath + "\\field.htm", fieldInfo);
            }
            return mResult;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="renderArgs"></param>
        string RenderControls(string pattern,string sourceText,string replaceValue)
        {
            //string fieldPattern = @"{!FieldId}";

            string result = SharedUtil.ReplaceTagsByRegex(sourceText, new Regex(pattern, RegexOptions.IgnoreCase),
               new SharedUtil.GetReplaceStringDelegate(delegate(string mactchValue)
               {                   
                   return replaceValue;
               }));
            return  result;
        }
       
        //
        // 文档、模板管理代码    结束  *******************************
        //



        //
        // 版本管理代码    开始  *******************************
        //

        //列出所有版本信息
        private bool ListVersion()
        {
            bool mResult = false;

            mFileID = "\r\n";
            mDateTime = "保存时间\r\n";
            mUserName = "用户名\r\n";
            mDescript = "版本说明\r\n";
            try
            {
                string strSelectCmd = "SELECT FileID,FileDate,UserName,Descript FROM Version_File WHERE RecordID='" + mRecordID + "'";
                SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
                SqlDataReader mReader = mCommand.ExecuteReader();
                while (mReader.Read())
                {
                    mFileID += mReader["FileID"].ToString() + "\r\n";                  //文件号列表
                    mDateTime += mReader["FileDate"].ToString() + "\r\n";                           //日期列表
                    mUserName += mReader["UserName"].ToString() + "\r\n";                           //用户名列表
                    mDescript += mReader["Descript"].ToString() + "\r\n";                           //如果说明信息里有回车，则将回车变成>符号
                }
                mReader.Close();
                mResult = true;
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }
        //调入选中版本，通过文件号调用mFileID,并把文件放入mFileBody里，以便进行打包
        private bool LoadVersion(string mFileID)
        {
            bool mResult = false;
            try
            {
                string strSelectCmd = "SELECT FileBody FROM Version_File WHERE RecordID='" + mRecordID + "' and  FileID=" + mFileID;
                SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
                SqlDataReader mReader = mCommand.ExecuteReader();
                if (mReader.Read())
                {
                    mFileBody = mReader.GetSqlBinary(0).Value;
                    mResult = true;
                }
                else
                {
                    mResult = false;
                }
                mReader.Close();
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }

        //保存版本，将该版本文件存盘，并将说明信息也保存起来
        private bool SaveVersion()
        {
            bool mResult = false;
            SqlCommand nCommand;
            string strInsertCmd;

            strInsertCmd = "insert into Version_File (RecordID,FileName,FileType,FileSize,FileDate,FileBody,FilePath,UserName,Descript) values (@RecordID,@FileName,@FileType,@FileSize,@FileDate,@FileBody,@FilePath,@UserName,@Descript)";
            nCommand = new SqlCommand(strInsertCmd, DBAobj.Connection);
            try
            {
                nCommand.Parameters.Add(new SqlParameter("@RecordID", SqlDbType.VarChar, 16));
                nCommand.Parameters["@RecordID"].Value = mRecordID;


                nCommand.Parameters.Add(new SqlParameter("@FileName", SqlDbType.VarChar, 64));
                nCommand.Parameters["@FileName"].Value = mFileName;


                nCommand.Parameters.Add(new SqlParameter("@FileType", SqlDbType.VarChar, 4));
                nCommand.Parameters["@FileType"].Value = mFileType;


                nCommand.Parameters.Add(new SqlParameter("@FileSize", SqlDbType.Int));
                nCommand.Parameters["@FileSize"].Value = mFileSize;


                nCommand.Parameters.Add(new SqlParameter("@FileDate", SqlDbType.DateTime));
                nCommand.Parameters["@FileDate"].Value = mFileDate;


                nCommand.Parameters.Add(new SqlParameter("@FileBody", SqlDbType.Image));
                nCommand.Parameters["@FileBody"].Value = mFileBody;


                nCommand.Parameters.Add(new SqlParameter("@FilePath", SqlDbType.VarChar, 64));
                nCommand.Parameters["@FilePath"].Value = mFilePath;


                nCommand.Parameters.Add(new SqlParameter("@UserName", SqlDbType.VarChar, 32));
                nCommand.Parameters["@UserName"].Value = mUserName;


                nCommand.Parameters.Add(new SqlParameter("@Descript", SqlDbType.VarChar, 64));
                nCommand.Parameters["@Descript"].Value = mDescript;
                nCommand.ExecuteNonQuery();
                mResult = true;
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }

        //
        // 版本管理代码    结束  *******************************
        //


        //
        // 标签管理代码   开始  *******************************
        //

        //创建标签列表
        private bool ListBookmarks()
        {

            bool mResult = false;

            mBookmark = "";
            mDescript = "";

            try
            {
                string strSelectCmd = "SELECT * FROM Bookmarks ";
                SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
                SqlDataReader mReader = mCommand.ExecuteReader();
                while (mReader.Read())
                {
                    mBookmark += mReader["BookMarkName"] + "\r\n";                              //用户名列表
                    mDescript += mReader["BookMarkDesc"] + "\r\n";                             //如果说明信息里有回车，则将回车变成>符号
                }
                mReader.Close();
                mResult = true;
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }


        //装入书签
        private bool LoadBookMarks()
        {
            bool mResult = false;
            try
            {
                string strSelectCmd = "select b.BookMarkName,b.BookMarkText from Template_BookMarks a,BookMarks b where a.BookMarkname=b.BookMarkName and a.RecordID='" + mTemplate + "'";
                SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
                SqlDataReader mReader = mCommand.ExecuteReader();
                while (mReader.Read())
                {
                    //说明：我们测试程序把SQL语句直接写到替换标签内容
                    //实际使用中，这个标签内容是通过Sql语句得到的。
                    //生成SQL查询语句  result.getString("BookMarkText") & "条件"
                    //当前纪录号位 mRecordID
                    //BookMarkValue=生成SQL运行结果
                    string mBookMarkName = mReader["BookMarkName"].ToString();
                    string mBookMarkValue = mReader["BookMarkText"].ToString();
                    MsgObj.SetMsgByName(mBookMarkName, mBookMarkValue);
                }
                mReader.Close();
                mResult = true;
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }

        //保存模板对应的标签，第7个标签开始，0-6是iWebOffice全局变量(DBSTEP OPTION RECORDID TEMPLATE FILENAME FILETYPE USERNAME)
        private bool SaveBookMarks()
        {
            bool mResult = false;

            string mBookMarkName;
            int mIndex;
            try
            {
                string strDeleteCmd = "DELETE FROM Template_BookMarks Where RecordID='" + mTemplate + "'";
                SqlCommand nCommand = new SqlCommand(strDeleteCmd, DBAobj.Connection);
                nCommand.ExecuteNonQuery();

                for (mIndex = 7; mIndex <= MsgObj.GetFieldCount() - 1; mIndex++)
                {
                    mBookMarkName = MsgObj.GetFieldName(mIndex);
                    string strInsertCmd = "insert into Template_BookMarks (RecordId,BookMarkName) values ('" + mTemplate + "','" + mBookMarkName + "')";
                    SqlCommand mCommand = new SqlCommand(strInsertCmd, DBAobj.Connection);
                    mCommand.ExecuteNonQuery();
                }
                mResult = true;
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }

        //
        // 标签管理代码    结束  *******************************
        //


        //
        // 签章管理代码    开始  *******************************
        //

        //创建签章名称列表
        private bool LoadMarkList()
        {
            bool mResult = false;
            try
            {
                mMarkList = "";
                string strSelectCmd = "SELECT MarkName FROM Signature";
                SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
                SqlDataReader mReader = mCommand.ExecuteReader();
                while (mReader.Read())
                {
                    mMarkList += mReader["MarkName"].ToString() + "\r\n";
                }
                mReader.Close();
                mResult = true;
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }

        //调出签章图案
        private bool LoadMarkImage(string vMarkName, string vPassWord)
        {
            bool mResult = false;
            try
            {
                string strSelectCmd = "SELECT MarkBody,MarkType,MarkPath FROM Signature WHERE MarkName='" + vMarkName + "' and PassWord='" + vPassWord + "'";
                SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
                SqlDataReader mReader = mCommand.ExecuteReader();
                if (mReader.Read())
                {
                    string markPath = StringUtil.GetString(mReader["MarkPath"]);
                    Supermore.Diagnostics.Trace.LogTest(markPath);
                    //if (mReader["MarkBody"] != System.DBNull.Value)
                    //    mFileBody = (byte[])mReader["MarkBody"];
                    //if (mFileBody == null)
                    //{
                        if (!string.IsNullOrEmpty(markPath))
                        {
                            mFileBody = Supermore.IO.FileUtil.ReadBinaryFile(markPath);
                        }
                    //}
                    mFileType = StringUtil.GetString(mReader["MarkType"]);
                    Supermore.Diagnostics.Trace.LogTest(mFileType);
                    mResult = true;
                }
                else
                {
                    mResult = false;
                }
                mReader.Close();
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);

        }

        //保存印章，将该印章存盘，并将说明信息也保存起来
        private bool SaveSignature()
        {
            bool mResult = false;
            SqlCommand nCommand;
            string strInsertCmd;

            strInsertCmd = "insert into Document_Signature ([RecordID],[MarkName],[UserName],[DateTime],[HostName],[MarkGuid]) values (@RecordID,@MarkName,@UserName,@DateTime,@HostName,@MarkGuid) ";
            nCommand = new SqlCommand(strInsertCmd, DBAobj.Connection);

            try
            {
                nCommand.Parameters.Add(new SqlParameter("@RecordID", SqlDbType.VarChar, 16));
                nCommand.Parameters["@RecordID"].Value = mRecordID;


                nCommand.Parameters.Add(new SqlParameter("@MarkName", SqlDbType.VarChar, 64));
                nCommand.Parameters["@MarkName"].Value = mMarkName;


                nCommand.Parameters.Add(new SqlParameter("@UserName", SqlDbType.VarChar, 32));
                nCommand.Parameters["@UserName"].Value = mUserName;


                nCommand.Parameters.Add(new SqlParameter("@DateTime", SqlDbType.DateTime));
                nCommand.Parameters["@DateTime"].Value = mDateTime;


                nCommand.Parameters.Add(new SqlParameter("@HostName", SqlDbType.VarChar, 64));
                nCommand.Parameters["@HostName"].Value = mHostName;


                nCommand.Parameters.Add(new SqlParameter("@MarkGuid", SqlDbType.VarChar, 64));
                nCommand.Parameters["@MarkGuid"].Value = mMarkGuid;

                nCommand.ExecuteNonQuery();
                mResult = true;
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }


        //列出所有版本信息
        private bool LoadSignature()
        {
            bool mResult = false;

            try
            {
                mMarkName = "印章名称\r\n";
                mUserName = "签名人\r\n";
                mDateTime = "签章时间\r\n";
                mHostName = "客户端IP\r\n";
                mMarkGuid = "序列号\r\n";

                string strSelectCmd = "SELECT [MarkName],[UserName],[DateTime],[HostName],[MarkGuid] FROM Document_Signature WHERE RecordID='" + mRecordID + "'";
                SqlCommand mCommand = new SqlCommand(strSelectCmd, DBAobj.Connection);
                SqlDataReader mReader = mCommand.ExecuteReader();
                while (mReader.Read())
                {
                    mMarkName += mReader["MarkName"].ToString() + "\r\n";                  		     //文件号列表
                    mUserName += mReader["UserName"].ToString() + "\r\n";                           //日期列表
                    mDateTime += mReader.GetDateTime(2).ToString("yyyy-MM-dd HH:mm:ss") + "\r\n";                           //用户名列表
                    mHostName += mReader["HostName"].ToString() + "\r\n";                           //如果说明信息里有回车，则将回车变成>符号
                    mMarkGuid += mReader["MarkGuid"].ToString() + "\r\n";
                }
                mReader.Close();
                mResult = true;
            }
            catch (SqlException e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }

        //
        // 签章管理代码    结束  *******************************
        //

        //
        // 扩展功能代码    开始  *******************************
        //
        //调出所对应的文本 
        private bool LoadContent()
        {
            bool mResult = false;
            //打开数据库
            //根据 mRecordID 或 mFileName 等信息
            //提取文本信息付给mContent即可。
            //本演示假设取得的文本信息如下：

            mContent = "";
            mContent += "本文的纪录号：" + mRecordID + "\n";
            mContent += "本文的文件名：" + mFileName + "\n";
            mContent += "    这个部分请自己加入，和你们的数据库结合起来就可以了\n";
            mResult = true;
            return (mResult);
        }

        //保存所对应的文本 
        private bool SaveContent()
        {
            bool mResult = false;
            //打开数据库
            //根据 mRecordID 或 mFileName 等信息
            //插入文本信息 mContent里的文本到数据库中即可。
            mResult = true;
            return (mResult);
        }



        //增加行并填充表格内容
        private bool GetWordTable()
        {
            int i, n;
            string strI, strN;
            bool mResult;

            //该部分内容可以从数据库中读取
            try
            {
                for (i = 1; i <= mColumns; i++)
                {
                    strI = i.ToString();
                    for (n = 1; n <= mCells; n++)
                    {
                        strN = n.ToString();
                        MsgObj.SetMsgByName(strI + strN, "内容" + DBAobj.GetDateTime());
                    }
                }
                mResult = true;
            }
            catch (Exception e)
            {
                mError = e.ToString();
                mResult = false;
            }
            return (mResult);
        }

        private bool UpdataCopies(int mLeftCopies)
        {
            bool mResult;
            mResult = true;

            //该函数可以把打印减少的次数记录到数据库

            //根据自己的系统进行扩展该功能
            return (mResult);
        }

    }
}