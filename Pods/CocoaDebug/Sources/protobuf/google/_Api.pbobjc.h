// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: google/protobuf/api.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(_GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define _GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if _GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/__GPBDescriptor.h>
 #import <Protobuf/__GPBMessage.h>
 #import <Protobuf/__GPBRootObject.h>
#else
 #import "_GPBDescriptor.h"
 #import "_GPBMessage.h"
 #import "_GPBRootObject.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30002
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30002 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class _GPBMethod;
@class _GPBMixin;
@class _GPBOption;
@class _GPBSourceContext;
_GPB_ENUM_FWD_DECLARE(_GPBSyntax);

NS_ASSUME_NONNULL_BEGIN

#pragma mark - _GPBApiRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (_GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c _GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
@interface _GPBApiRoot : _GPBRootObject
@end

#pragma mark - _GPBApi

typedef _GPB_ENUM(_GPBApi_FieldNumber) {
  _GPBApi_FieldNumber_Name = 1,
  _GPBApi_FieldNumber_MethodsArray = 2,
  _GPBApi_FieldNumber_OptionsArray = 3,
  _GPBApi_FieldNumber_Version = 4,
  _GPBApi_FieldNumber_SourceContext = 5,
  _GPBApi_FieldNumber_MixinsArray = 6,
  _GPBApi_FieldNumber_Syntax = 7,
};

/**
 * Api is a light-weight descriptor for an API Interface.
 *
 * Interfaces are also described as "protocol buffer services" in some contexts,
 * such as by the "service" keyword in a .proto file, but they are different
 * from API Services, which represent a concrete implementation of an interface
 * as opposed to simply a description of methods and bindings. They are also
 * sometimes simply referred to as "APIs" in other contexts, such as the name of
 * this message itself. See https://cloud.google.com/apis/design/glossary for
 * detailed terminology.
 **/
@interface _GPBApi : _GPBMessage

/**
 * The fully qualified name of this interface, including package name
 * followed by the interface's simple name.
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** The methods of this interface, in unspecified order. */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<_GPBMethod*> *methodsArray;
/** The number of items in @c methodsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger methodsArray_Count;

/** Any metadata attached to the interface. */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<_GPBOption*> *optionsArray;
/** The number of items in @c optionsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger optionsArray_Count;

/**
 * A version string for this interface. If specified, must have the form
 * `major-version.minor-version`, as in `1.10`. If the minor version is
 * omitted, it defaults to zero. If the entire version field is empty, the
 * major version is derived from the package name, as outlined below. If the
 * field is not empty, the version in the package name will be verified to be
 * consistent with what is provided here.
 *
 * The versioning schema uses [semantic
 * versioning](http://semver.org) where the major version number
 * indicates a breaking change and the minor version an additive,
 * non-breaking change. Both version numbers are signals to users
 * what to expect from different versions, and should be carefully
 * chosen based on the product plan.
 *
 * The major version is also reflected in the package name of the
 * interface, which must end in `v<major-version>`, as in
 * `google.feature.v1`. For major versions 0 and 1, the suffix can
 * be omitted. Zero major versions must only be used for
 * experimental, non-GA interfaces.
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *version;

/**
 * Source context for the protocol buffer service represented by this
 * message.
 **/
@property(nonatomic, readwrite, strong, null_resettable) _GPBSourceContext *sourceContext;
/** Test to see if @c sourceContext has been set. */
@property(nonatomic, readwrite) BOOL hasSourceContext;

/** Included interfaces. See [Mixin][]. */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<_GPBMixin*> *mixinsArray;
/** The number of items in @c mixinsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger mixinsArray_Count;

/** The source syntax of the service. */
@property(nonatomic, readwrite) enum _GPBSyntax syntax;

@end

/**
 * Fetches the raw value of a @c _GPBApi's @c syntax property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t _GPBApi_Syntax_RawValue(_GPBApi *message);
/**
 * Sets the raw value of an @c _GPBApi's @c syntax property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void Set_GPBApi_Syntax_RawValue(_GPBApi *message, int32_t value);

#pragma mark - _GPBMethod

typedef _GPB_ENUM(_GPBMethod_FieldNumber) {
  _GPBMethod_FieldNumber_Name = 1,
  _GPBMethod_FieldNumber_RequestTypeURL = 2,
  _GPBMethod_FieldNumber_RequestStreaming = 3,
  _GPBMethod_FieldNumber_ResponseTypeURL = 4,
  _GPBMethod_FieldNumber_ResponseStreaming = 5,
  _GPBMethod_FieldNumber_OptionsArray = 6,
  _GPBMethod_FieldNumber_Syntax = 7,
};

/**
 * Method represents a method of an API interface.
 **/
@interface _GPBMethod : _GPBMessage

/** The simple name of this method. */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/** A URL of the input message type. */
@property(nonatomic, readwrite, copy, null_resettable) NSString *requestTypeURL;

/** If true, the request is streamed. */
@property(nonatomic, readwrite) BOOL requestStreaming;

/** The URL of the output message type. */
@property(nonatomic, readwrite, copy, null_resettable) NSString *responseTypeURL;

/** If true, the response is streamed. */
@property(nonatomic, readwrite) BOOL responseStreaming;

/** Any metadata attached to the method. */
@property(nonatomic, readwrite, strong, null_resettable) NSMutableArray<_GPBOption*> *optionsArray;
/** The number of items in @c optionsArray without causing the array to be created. */
@property(nonatomic, readonly) NSUInteger optionsArray_Count;

/** The source syntax of this method. */
@property(nonatomic, readwrite) enum _GPBSyntax syntax;

@end

/**
 * Fetches the raw value of a @c _GPBMethod's @c syntax property, even
 * if the value was not defined by the enum at the time the code was generated.
 **/
int32_t _GPBMethod_Syntax_RawValue(_GPBMethod *message);
/**
 * Sets the raw value of an @c _GPBMethod's @c syntax property, allowing
 * it to be set to a value that was not defined by the enum at the time the code
 * was generated.
 **/
void Set_GPBMethod_Syntax_RawValue(_GPBMethod *message, int32_t value);

#pragma mark - _GPBMixin

typedef _GPB_ENUM(_GPBMixin_FieldNumber) {
  _GPBMixin_FieldNumber_Name = 1,
  _GPBMixin_FieldNumber_Root = 2,
};

/**
 * Declares an API Interface to be included in this interface. The including
 * interface must redeclare all the methods from the included interface, but
 * documentation and options are inherited as follows:
 *
 * - If after comment and whitespace stripping, the documentation
 *   string of the redeclared method is empty, it will be inherited
 *   from the original method.
 *
 * - Each annotation belonging to the service config (http,
 *   visibility) which is not set in the redeclared method will be
 *   inherited.
 *
 * - If an http annotation is inherited, the path pattern will be
 *   modified as follows. Any version prefix will be replaced by the
 *   version of the including interface plus the [root][] path if
 *   specified.
 *
 * Example of a simple mixin:
 *
 *     package google.acl.v1;
 *     service AccessControl {
 *       // Get the underlying ACL object.
 *       rpc GetAcl(GetAclRequest) returns (Acl) {
 *         option (google.api.http).get = "/v1/{resource=**}:getAcl";
 *       }
 *     }
 *
 *     package google.storage.v2;
 *     service Storage {
 *       rpc GetAcl(GetAclRequest) returns (Acl);
 *
 *       // Get a data record.
 *       rpc GetData(GetDataRequest) returns (Data) {
 *         option (google.api.http).get = "/v2/{resource=**}";
 *       }
 *     }
 *
 * Example of a mixin configuration:
 *
 *     apis:
 *     - name: google.storage.v2.Storage
 *       mixins:
 *       - name: google.acl.v1.AccessControl
 *
 * The mixin construct implies that all methods in `AccessControl` are
 * also declared with same name and request/response types in
 * `Storage`. A documentation generator or annotation processor will
 * see the effective `Storage.GetAcl` method after inherting
 * documentation and annotations as follows:
 *
 *     service Storage {
 *       // Get the underlying ACL object.
 *       rpc GetAcl(GetAclRequest) returns (Acl) {
 *         option (google.api.http).get = "/v2/{resource=**}:getAcl";
 *       }
 *       ...
 *     }
 *
 * Note how the version in the path pattern changed from `v1` to `v2`.
 *
 * If the `root` field in the mixin is specified, it should be a
 * relative path under which inherited HTTP paths are placed. Example:
 *
 *     apis:
 *     - name: google.storage.v2.Storage
 *       mixins:
 *       - name: google.acl.v1.AccessControl
 *         root: acls
 *
 * This implies the following inherited HTTP annotation:
 *
 *     service Storage {
 *       // Get the underlying ACL object.
 *       rpc GetAcl(GetAclRequest) returns (Acl) {
 *         option (google.api.http).get = "/v2/acls/{resource=**}:getAcl";
 *       }
 *       ...
 *     }
 **/
@interface _GPBMixin : _GPBMessage

/** The fully qualified name of the interface which is included. */
@property(nonatomic, readwrite, copy, null_resettable) NSString *name;

/**
 * If non-empty specifies a path under which inherited HTTP paths
 * are rooted.
 **/
@property(nonatomic, readwrite, copy, null_resettable) NSString *root;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
