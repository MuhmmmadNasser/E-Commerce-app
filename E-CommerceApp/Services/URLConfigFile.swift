//
//  URLConfigFile.swift
//  E-CommerceApp
//
//  Created by Mohamed on 05/10/2021.
//

import Foundation
struct URLConfigFile {
    
    // BASE URL
    static let baseUrl = "http://emleplayer.com/ovrall_rev"
    static let baseImageUrl = "http://emleplayer.com/ovrall_rev/Pics/file"
    
    //LOG IN
    static let passwordForget = "/password_forget.php"
    static let passwordRestoreCode = "/password_restore_code.php"
    static let passwordRestore = "/password_restore.php"
    static let userLogin = "/user_login.php"
    
    //SIGN UP
    static let emailRealTimeCheck = "/email_realtime_check.php"
    static let userSignUp = "/user_signup.php"
    static let govern = "/govern.php"
    static let emailConfirm = "/email_confirm.php"
    static let emailGetCode = "/email_get_code.php"
    
    //HOME
    static let productsGet = "/products_get.php"
    static let userFavoriteInsert = "/user_favorite_insert.php"
    
    //PRODUCT DETAILS
    static let userFavoriteDelete = "/user_favorite_delete.php"
    static let productGet = "/product_get.php"
    
    //Favorites Products
    static let userFavoriteGet = "/user_favorite_get.php"
    
    //Change setting
    static let uploadFile = "/upload_file.php"
    static let profileChangeSetting = "/profile_change_setting.php"
    static let  profileChangePassword = "/profile_change_password.php"
    
    
    //MARK: - LogIn URL
    /// POST (String email)
    static let passwordForgetUrl = baseUrl + passwordForget
    
    ///POST(String email , String code)
    static let passwordRestoreCodeUrl = baseUrl + passwordRestoreCode
    
    ///POST(String email , String password)
    static let passwordRestoreUrl = baseUrl + passwordRestore
    
    ///POST(String emailOrPhone , String password)
    static let userLoginUrl = baseUrl + userLogin
    
    
    
    //MARK: - Sign Up URL
    ///POST(String email)
    static let emailRealTimeCheckUrl = baseUrl + emailRealTimeCheck
    
    ///POST(String User)
    static let userSignUpUrl = baseUrl + userSignUp
    
    ///POST()
    static let governUrl = baseUrl + govern
    
    ///POST(String email , String code)
    static let emailConfirmUrl = baseUrl + emailConfirm

    ///POST(String email)
    static let emailGetCodeUrl = baseUrl + emailGetCode
    
    
    
    //MARK: - Home URL
    ///POST(String userId)
    static let productsGetUrl = baseUrl + productsGet
    
    ///POST(String userId , String productId)
    static let userFavoriteInsertUrl = baseUrl + userFavoriteInsert
    
    
    
    //MARK: - Product details URL
    ///POST(String userId , String productId)
    static let userFavoriteDeleteUrl = baseUrl + userFavoriteDelete
    
    ///POST(String userId , String productId)
    static let productGetUrl = baseUrl + productGet
    
    
    
    //MARK: - Favorites Products URL
    ///POST(String userId)
    static let userFavoriteGetUrl = baseUrl + userFavoriteGet
    
    
    
    //MARK: - Change setting
    ///POST(file image )
    static let uploadFileUrl = baseUrl + uploadFile
    
    ///POST(string User)
    static let profileChangeSettingUrl = baseUrl + profileChangeSetting
    
    ///POST(String userId , String oldPass , String newPass)
    static let profileChangePasswordUrl = baseUrl + profileChangePassword
    
    
}
