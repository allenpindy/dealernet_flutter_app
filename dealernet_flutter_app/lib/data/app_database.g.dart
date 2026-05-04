// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordSaltMeta =
      const VerificationMeta('passwordSalt');
  @override
  late final GeneratedColumn<String> passwordSalt = GeneratedColumn<String>(
      'password_salt', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, username, passwordHash, passwordSalt, fullName, companyName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('password_salt')) {
      context.handle(
          _passwordSaltMeta,
          passwordSalt.isAcceptableOrUnknown(
              data['password_salt']!, _passwordSaltMeta));
    } else if (isInserting) {
      context.missing(_passwordSaltMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      passwordHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash'])!,
      passwordSalt: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_salt'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String passwordHash;
  final String passwordSalt;
  final String fullName;
  final String companyName;
  const User(
      {required this.id,
      required this.username,
      required this.passwordHash,
      required this.passwordSalt,
      required this.fullName,
      required this.companyName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password_hash'] = Variable<String>(passwordHash);
    map['password_salt'] = Variable<String>(passwordSalt);
    map['full_name'] = Variable<String>(fullName);
    map['company_name'] = Variable<String>(companyName);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      passwordHash: Value(passwordHash),
      passwordSalt: Value(passwordSalt),
      fullName: Value(fullName),
      companyName: Value(companyName),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      passwordSalt: serializer.fromJson<String>(json['passwordSalt']),
      fullName: serializer.fromJson<String>(json['fullName']),
      companyName: serializer.fromJson<String>(json['companyName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'passwordSalt': serializer.toJson<String>(passwordSalt),
      'fullName': serializer.toJson<String>(fullName),
      'companyName': serializer.toJson<String>(companyName),
    };
  }

  User copyWith(
          {int? id,
          String? username,
          String? passwordHash,
          String? passwordSalt,
          String? fullName,
          String? companyName}) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        passwordHash: passwordHash ?? this.passwordHash,
        passwordSalt: passwordSalt ?? this.passwordSalt,
        fullName: fullName ?? this.fullName,
        companyName: companyName ?? this.companyName,
      );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      passwordSalt: data.passwordSalt.present
          ? data.passwordSalt.value
          : this.passwordSalt,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      companyName:
          data.companyName.present ? data.companyName.value : this.companyName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('passwordSalt: $passwordSalt, ')
          ..write('fullName: $fullName, ')
          ..write('companyName: $companyName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, username, passwordHash, passwordSalt, fullName, companyName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.passwordHash == this.passwordHash &&
          other.passwordSalt == this.passwordSalt &&
          other.fullName == this.fullName &&
          other.companyName == this.companyName);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> passwordHash;
  final Value<String> passwordSalt;
  final Value<String> fullName;
  final Value<String> companyName;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.passwordSalt = const Value.absent(),
    this.fullName = const Value.absent(),
    this.companyName = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String passwordHash,
    required String passwordSalt,
    required String fullName,
    required String companyName,
  })  : username = Value(username),
        passwordHash = Value(passwordHash),
        passwordSalt = Value(passwordSalt),
        fullName = Value(fullName),
        companyName = Value(companyName);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? passwordHash,
    Expression<String>? passwordSalt,
    Expression<String>? fullName,
    Expression<String>? companyName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (passwordSalt != null) 'password_salt': passwordSalt,
      if (fullName != null) 'full_name': fullName,
      if (companyName != null) 'company_name': companyName,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? passwordHash,
      Value<String>? passwordSalt,
      Value<String>? fullName,
      Value<String>? companyName}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
      passwordSalt: passwordSalt ?? this.passwordSalt,
      fullName: fullName ?? this.fullName,
      companyName: companyName ?? this.companyName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (passwordSalt.present) {
      map['password_salt'] = Variable<String>(passwordSalt.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('passwordSalt: $passwordSalt, ')
          ..write('fullName: $fullName, ')
          ..write('companyName: $companyName')
          ..write(')'))
        .toString();
  }
}

class $JobsTable extends Jobs with TableInfo<$JobsTable, Job> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<String> jobId = GeneratedColumn<String>(
      'job_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _arrivedAtMeta =
      const VerificationMeta('arrivedAt');
  @override
  late final GeneratedColumn<DateTime> arrivedAt = GeneratedColumn<DateTime>(
      'arrived_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, jobId, customerName, address, arrivedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'jobs';
  @override
  VerificationContext validateIntegrity(Insertable<Job> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('job_id')) {
      context.handle(
          _jobIdMeta, jobId.isAcceptableOrUnknown(data['job_id']!, _jobIdMeta));
    } else if (isInserting) {
      context.missing(_jobIdMeta);
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('arrived_at')) {
      context.handle(_arrivedAtMeta,
          arrivedAt.isAcceptableOrUnknown(data['arrived_at']!, _arrivedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Job map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Job(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      jobId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}job_id'])!,
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name'])!,
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address'])!,
      arrivedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}arrived_at']),
    );
  }

  @override
  $JobsTable createAlias(String alias) {
    return $JobsTable(attachedDatabase, alias);
  }
}

class Job extends DataClass implements Insertable<Job> {
  final int id;
  final String jobId;
  final String customerName;
  final String address;
  final DateTime? arrivedAt;
  const Job(
      {required this.id,
      required this.jobId,
      required this.customerName,
      required this.address,
      this.arrivedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['job_id'] = Variable<String>(jobId);
    map['customer_name'] = Variable<String>(customerName);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || arrivedAt != null) {
      map['arrived_at'] = Variable<DateTime>(arrivedAt);
    }
    return map;
  }

  JobsCompanion toCompanion(bool nullToAbsent) {
    return JobsCompanion(
      id: Value(id),
      jobId: Value(jobId),
      customerName: Value(customerName),
      address: Value(address),
      arrivedAt: arrivedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(arrivedAt),
    );
  }

  factory Job.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Job(
      id: serializer.fromJson<int>(json['id']),
      jobId: serializer.fromJson<String>(json['jobId']),
      customerName: serializer.fromJson<String>(json['customerName']),
      address: serializer.fromJson<String>(json['address']),
      arrivedAt: serializer.fromJson<DateTime?>(json['arrivedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'jobId': serializer.toJson<String>(jobId),
      'customerName': serializer.toJson<String>(customerName),
      'address': serializer.toJson<String>(address),
      'arrivedAt': serializer.toJson<DateTime?>(arrivedAt),
    };
  }

  Job copyWith(
          {int? id,
          String? jobId,
          String? customerName,
          String? address,
          Value<DateTime?> arrivedAt = const Value.absent()}) =>
      Job(
        id: id ?? this.id,
        jobId: jobId ?? this.jobId,
        customerName: customerName ?? this.customerName,
        address: address ?? this.address,
        arrivedAt: arrivedAt.present ? arrivedAt.value : this.arrivedAt,
      );
  Job copyWithCompanion(JobsCompanion data) {
    return Job(
      id: data.id.present ? data.id.value : this.id,
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      customerName: data.customerName.present
          ? data.customerName.value
          : this.customerName,
      address: data.address.present ? data.address.value : this.address,
      arrivedAt: data.arrivedAt.present ? data.arrivedAt.value : this.arrivedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Job(')
          ..write('id: $id, ')
          ..write('jobId: $jobId, ')
          ..write('customerName: $customerName, ')
          ..write('address: $address, ')
          ..write('arrivedAt: $arrivedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, jobId, customerName, address, arrivedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Job &&
          other.id == this.id &&
          other.jobId == this.jobId &&
          other.customerName == this.customerName &&
          other.address == this.address &&
          other.arrivedAt == this.arrivedAt);
}

class JobsCompanion extends UpdateCompanion<Job> {
  final Value<int> id;
  final Value<String> jobId;
  final Value<String> customerName;
  final Value<String> address;
  final Value<DateTime?> arrivedAt;
  const JobsCompanion({
    this.id = const Value.absent(),
    this.jobId = const Value.absent(),
    this.customerName = const Value.absent(),
    this.address = const Value.absent(),
    this.arrivedAt = const Value.absent(),
  });
  JobsCompanion.insert({
    this.id = const Value.absent(),
    required String jobId,
    required String customerName,
    required String address,
    this.arrivedAt = const Value.absent(),
  })  : jobId = Value(jobId),
        customerName = Value(customerName),
        address = Value(address);
  static Insertable<Job> custom({
    Expression<int>? id,
    Expression<String>? jobId,
    Expression<String>? customerName,
    Expression<String>? address,
    Expression<DateTime>? arrivedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (jobId != null) 'job_id': jobId,
      if (customerName != null) 'customer_name': customerName,
      if (address != null) 'address': address,
      if (arrivedAt != null) 'arrived_at': arrivedAt,
    });
  }

  JobsCompanion copyWith(
      {Value<int>? id,
      Value<String>? jobId,
      Value<String>? customerName,
      Value<String>? address,
      Value<DateTime?>? arrivedAt}) {
    return JobsCompanion(
      id: id ?? this.id,
      jobId: jobId ?? this.jobId,
      customerName: customerName ?? this.customerName,
      address: address ?? this.address,
      arrivedAt: arrivedAt ?? this.arrivedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (jobId.present) {
      map['job_id'] = Variable<String>(jobId.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (arrivedAt.present) {
      map['arrived_at'] = Variable<DateTime>(arrivedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobsCompanion(')
          ..write('id: $id, ')
          ..write('jobId: $jobId, ')
          ..write('customerName: $customerName, ')
          ..write('address: $address, ')
          ..write('arrivedAt: $arrivedAt')
          ..write(')'))
        .toString();
  }
}

class $EquipmentTable extends Equipment
    with TableInfo<$EquipmentTable, EquipmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EquipmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, sku, name, category, active];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'equipment';
  @override
  VerificationContext validateIntegrity(Insertable<EquipmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EquipmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EquipmentData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
    );
  }

  @override
  $EquipmentTable createAlias(String alias) {
    return $EquipmentTable(attachedDatabase, alias);
  }
}

class EquipmentData extends DataClass implements Insertable<EquipmentData> {
  final int id;
  final String sku;
  final String name;
  final String category;
  final bool active;
  const EquipmentData(
      {required this.id,
      required this.sku,
      required this.name,
      required this.category,
      required this.active});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['sku'] = Variable<String>(sku);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['active'] = Variable<bool>(active);
    return map;
  }

  EquipmentCompanion toCompanion(bool nullToAbsent) {
    return EquipmentCompanion(
      id: Value(id),
      sku: Value(sku),
      name: Value(name),
      category: Value(category),
      active: Value(active),
    );
  }

  factory EquipmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EquipmentData(
      id: serializer.fromJson<int>(json['id']),
      sku: serializer.fromJson<String>(json['sku']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'sku': serializer.toJson<String>(sku),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'active': serializer.toJson<bool>(active),
    };
  }

  EquipmentData copyWith(
          {int? id,
          String? sku,
          String? name,
          String? category,
          bool? active}) =>
      EquipmentData(
        id: id ?? this.id,
        sku: sku ?? this.sku,
        name: name ?? this.name,
        category: category ?? this.category,
        active: active ?? this.active,
      );
  EquipmentData copyWithCompanion(EquipmentCompanion data) {
    return EquipmentData(
      id: data.id.present ? data.id.value : this.id,
      sku: data.sku.present ? data.sku.value : this.sku,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentData(')
          ..write('id: $id, ')
          ..write('sku: $sku, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sku, name, category, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EquipmentData &&
          other.id == this.id &&
          other.sku == this.sku &&
          other.name == this.name &&
          other.category == this.category &&
          other.active == this.active);
}

class EquipmentCompanion extends UpdateCompanion<EquipmentData> {
  final Value<int> id;
  final Value<String> sku;
  final Value<String> name;
  final Value<String> category;
  final Value<bool> active;
  const EquipmentCompanion({
    this.id = const Value.absent(),
    this.sku = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.active = const Value.absent(),
  });
  EquipmentCompanion.insert({
    this.id = const Value.absent(),
    required String sku,
    required String name,
    required String category,
    this.active = const Value.absent(),
  })  : sku = Value(sku),
        name = Value(name),
        category = Value(category);
  static Insertable<EquipmentData> custom({
    Expression<int>? id,
    Expression<String>? sku,
    Expression<String>? name,
    Expression<String>? category,
    Expression<bool>? active,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sku != null) 'sku': sku,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (active != null) 'active': active,
    });
  }

  EquipmentCompanion copyWith(
      {Value<int>? id,
      Value<String>? sku,
      Value<String>? name,
      Value<String>? category,
      Value<bool>? active}) {
    return EquipmentCompanion(
      id: id ?? this.id,
      sku: sku ?? this.sku,
      name: name ?? this.name,
      category: category ?? this.category,
      active: active ?? this.active,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EquipmentCompanion(')
          ..write('id: $id, ')
          ..write('sku: $sku, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }
}

class $JobEquipmentTable extends JobEquipment
    with TableInfo<$JobEquipmentTable, JobEquipmentData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobEquipmentTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _jobIdMeta = const VerificationMeta('jobId');
  @override
  late final GeneratedColumn<int> jobId = GeneratedColumn<int>(
      'job_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES jobs (id) ON DELETE CASCADE'));
  static const VerificationMeta _equipmentIdMeta =
      const VerificationMeta('equipmentId');
  @override
  late final GeneratedColumn<int> equipmentId = GeneratedColumn<int>(
      'equipment_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES equipment (id)'));
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [jobId, equipmentId, quantity];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_equipment';
  @override
  VerificationContext validateIntegrity(Insertable<JobEquipmentData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('job_id')) {
      context.handle(
          _jobIdMeta, jobId.isAcceptableOrUnknown(data['job_id']!, _jobIdMeta));
    } else if (isInserting) {
      context.missing(_jobIdMeta);
    }
    if (data.containsKey('equipment_id')) {
      context.handle(
          _equipmentIdMeta,
          equipmentId.isAcceptableOrUnknown(
              data['equipment_id']!, _equipmentIdMeta));
    } else if (isInserting) {
      context.missing(_equipmentIdMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {jobId, equipmentId};
  @override
  JobEquipmentData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobEquipmentData(
      jobId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}job_id'])!,
      equipmentId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}equipment_id'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
    );
  }

  @override
  $JobEquipmentTable createAlias(String alias) {
    return $JobEquipmentTable(attachedDatabase, alias);
  }
}

class JobEquipmentData extends DataClass
    implements Insertable<JobEquipmentData> {
  final int jobId;
  final int equipmentId;
  final int quantity;
  const JobEquipmentData(
      {required this.jobId, required this.equipmentId, required this.quantity});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['job_id'] = Variable<int>(jobId);
    map['equipment_id'] = Variable<int>(equipmentId);
    map['quantity'] = Variable<int>(quantity);
    return map;
  }

  JobEquipmentCompanion toCompanion(bool nullToAbsent) {
    return JobEquipmentCompanion(
      jobId: Value(jobId),
      equipmentId: Value(equipmentId),
      quantity: Value(quantity),
    );
  }

  factory JobEquipmentData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobEquipmentData(
      jobId: serializer.fromJson<int>(json['jobId']),
      equipmentId: serializer.fromJson<int>(json['equipmentId']),
      quantity: serializer.fromJson<int>(json['quantity']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'jobId': serializer.toJson<int>(jobId),
      'equipmentId': serializer.toJson<int>(equipmentId),
      'quantity': serializer.toJson<int>(quantity),
    };
  }

  JobEquipmentData copyWith({int? jobId, int? equipmentId, int? quantity}) =>
      JobEquipmentData(
        jobId: jobId ?? this.jobId,
        equipmentId: equipmentId ?? this.equipmentId,
        quantity: quantity ?? this.quantity,
      );
  JobEquipmentData copyWithCompanion(JobEquipmentCompanion data) {
    return JobEquipmentData(
      jobId: data.jobId.present ? data.jobId.value : this.jobId,
      equipmentId:
          data.equipmentId.present ? data.equipmentId.value : this.equipmentId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobEquipmentData(')
          ..write('jobId: $jobId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('quantity: $quantity')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(jobId, equipmentId, quantity);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobEquipmentData &&
          other.jobId == this.jobId &&
          other.equipmentId == this.equipmentId &&
          other.quantity == this.quantity);
}

class JobEquipmentCompanion extends UpdateCompanion<JobEquipmentData> {
  final Value<int> jobId;
  final Value<int> equipmentId;
  final Value<int> quantity;
  final Value<int> rowid;
  const JobEquipmentCompanion({
    this.jobId = const Value.absent(),
    this.equipmentId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  JobEquipmentCompanion.insert({
    required int jobId,
    required int equipmentId,
    this.quantity = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : jobId = Value(jobId),
        equipmentId = Value(equipmentId);
  static Insertable<JobEquipmentData> custom({
    Expression<int>? jobId,
    Expression<int>? equipmentId,
    Expression<int>? quantity,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (jobId != null) 'job_id': jobId,
      if (equipmentId != null) 'equipment_id': equipmentId,
      if (quantity != null) 'quantity': quantity,
      if (rowid != null) 'rowid': rowid,
    });
  }

  JobEquipmentCompanion copyWith(
      {Value<int>? jobId,
      Value<int>? equipmentId,
      Value<int>? quantity,
      Value<int>? rowid}) {
    return JobEquipmentCompanion(
      jobId: jobId ?? this.jobId,
      equipmentId: equipmentId ?? this.equipmentId,
      quantity: quantity ?? this.quantity,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (jobId.present) {
      map['job_id'] = Variable<int>(jobId.value);
    }
    if (equipmentId.present) {
      map['equipment_id'] = Variable<int>(equipmentId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobEquipmentCompanion(')
          ..write('jobId: $jobId, ')
          ..write('equipmentId: $equipmentId, ')
          ..write('quantity: $quantity, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProposalSignaturesTable extends ProposalSignatures
    with TableInfo<$ProposalSignaturesTable, ProposalSignature> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProposalSignaturesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _proposalIdMeta =
      const VerificationMeta('proposalId');
  @override
  late final GeneratedColumn<int> proposalId = GeneratedColumn<int>(
      'proposal_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _signaturePngMeta =
      const VerificationMeta('signaturePng');
  @override
  late final GeneratedColumn<Uint8List> signaturePng =
      GeneratedColumn<Uint8List>('signature_png', aliasedName, false,
          type: DriftSqlType.blob, requiredDuringInsert: true);
  static const VerificationMeta _signedAtMeta =
      const VerificationMeta('signedAt');
  @override
  late final GeneratedColumn<DateTime> signedAt = GeneratedColumn<DateTime>(
      'signed_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, proposalId, signaturePng, signedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'proposal_signatures';
  @override
  VerificationContext validateIntegrity(Insertable<ProposalSignature> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('proposal_id')) {
      context.handle(
          _proposalIdMeta,
          proposalId.isAcceptableOrUnknown(
              data['proposal_id']!, _proposalIdMeta));
    } else if (isInserting) {
      context.missing(_proposalIdMeta);
    }
    if (data.containsKey('signature_png')) {
      context.handle(
          _signaturePngMeta,
          signaturePng.isAcceptableOrUnknown(
              data['signature_png']!, _signaturePngMeta));
    } else if (isInserting) {
      context.missing(_signaturePngMeta);
    }
    if (data.containsKey('signed_at')) {
      context.handle(_signedAtMeta,
          signedAt.isAcceptableOrUnknown(data['signed_at']!, _signedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProposalSignature map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProposalSignature(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      proposalId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}proposal_id'])!,
      signaturePng: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}signature_png'])!,
      signedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}signed_at'])!,
    );
  }

  @override
  $ProposalSignaturesTable createAlias(String alias) {
    return $ProposalSignaturesTable(attachedDatabase, alias);
  }
}

class ProposalSignature extends DataClass
    implements Insertable<ProposalSignature> {
  final int id;
  final int proposalId;
  final Uint8List signaturePng;
  final DateTime signedAt;
  const ProposalSignature(
      {required this.id,
      required this.proposalId,
      required this.signaturePng,
      required this.signedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['proposal_id'] = Variable<int>(proposalId);
    map['signature_png'] = Variable<Uint8List>(signaturePng);
    map['signed_at'] = Variable<DateTime>(signedAt);
    return map;
  }

  ProposalSignaturesCompanion toCompanion(bool nullToAbsent) {
    return ProposalSignaturesCompanion(
      id: Value(id),
      proposalId: Value(proposalId),
      signaturePng: Value(signaturePng),
      signedAt: Value(signedAt),
    );
  }

  factory ProposalSignature.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProposalSignature(
      id: serializer.fromJson<int>(json['id']),
      proposalId: serializer.fromJson<int>(json['proposalId']),
      signaturePng: serializer.fromJson<Uint8List>(json['signaturePng']),
      signedAt: serializer.fromJson<DateTime>(json['signedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'proposalId': serializer.toJson<int>(proposalId),
      'signaturePng': serializer.toJson<Uint8List>(signaturePng),
      'signedAt': serializer.toJson<DateTime>(signedAt),
    };
  }

  ProposalSignature copyWith(
          {int? id,
          int? proposalId,
          Uint8List? signaturePng,
          DateTime? signedAt}) =>
      ProposalSignature(
        id: id ?? this.id,
        proposalId: proposalId ?? this.proposalId,
        signaturePng: signaturePng ?? this.signaturePng,
        signedAt: signedAt ?? this.signedAt,
      );
  ProposalSignature copyWithCompanion(ProposalSignaturesCompanion data) {
    return ProposalSignature(
      id: data.id.present ? data.id.value : this.id,
      proposalId:
          data.proposalId.present ? data.proposalId.value : this.proposalId,
      signaturePng: data.signaturePng.present
          ? data.signaturePng.value
          : this.signaturePng,
      signedAt: data.signedAt.present ? data.signedAt.value : this.signedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProposalSignature(')
          ..write('id: $id, ')
          ..write('proposalId: $proposalId, ')
          ..write('signaturePng: $signaturePng, ')
          ..write('signedAt: $signedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, proposalId, $driftBlobEquality.hash(signaturePng), signedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProposalSignature &&
          other.id == this.id &&
          other.proposalId == this.proposalId &&
          $driftBlobEquality.equals(other.signaturePng, this.signaturePng) &&
          other.signedAt == this.signedAt);
}

class ProposalSignaturesCompanion extends UpdateCompanion<ProposalSignature> {
  final Value<int> id;
  final Value<int> proposalId;
  final Value<Uint8List> signaturePng;
  final Value<DateTime> signedAt;
  const ProposalSignaturesCompanion({
    this.id = const Value.absent(),
    this.proposalId = const Value.absent(),
    this.signaturePng = const Value.absent(),
    this.signedAt = const Value.absent(),
  });
  ProposalSignaturesCompanion.insert({
    this.id = const Value.absent(),
    required int proposalId,
    required Uint8List signaturePng,
    this.signedAt = const Value.absent(),
  })  : proposalId = Value(proposalId),
        signaturePng = Value(signaturePng);
  static Insertable<ProposalSignature> custom({
    Expression<int>? id,
    Expression<int>? proposalId,
    Expression<Uint8List>? signaturePng,
    Expression<DateTime>? signedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (proposalId != null) 'proposal_id': proposalId,
      if (signaturePng != null) 'signature_png': signaturePng,
      if (signedAt != null) 'signed_at': signedAt,
    });
  }

  ProposalSignaturesCompanion copyWith(
      {Value<int>? id,
      Value<int>? proposalId,
      Value<Uint8List>? signaturePng,
      Value<DateTime>? signedAt}) {
    return ProposalSignaturesCompanion(
      id: id ?? this.id,
      proposalId: proposalId ?? this.proposalId,
      signaturePng: signaturePng ?? this.signaturePng,
      signedAt: signedAt ?? this.signedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (proposalId.present) {
      map['proposal_id'] = Variable<int>(proposalId.value);
    }
    if (signaturePng.present) {
      map['signature_png'] = Variable<Uint8List>(signaturePng.value);
    }
    if (signedAt.present) {
      map['signed_at'] = Variable<DateTime>(signedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProposalSignaturesCompanion(')
          ..write('id: $id, ')
          ..write('proposalId: $proposalId, ')
          ..write('signaturePng: $signaturePng, ')
          ..write('signedAt: $signedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $JobsTable jobs = $JobsTable(this);
  late final $EquipmentTable equipment = $EquipmentTable(this);
  late final $JobEquipmentTable jobEquipment = $JobEquipmentTable(this);
  late final $ProposalSignaturesTable proposalSignatures =
      $ProposalSignaturesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, jobs, equipment, jobEquipment, proposalSignatures];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('jobs',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('job_equipment', kind: UpdateKind.delete),
            ],
          ),
        ],
      );
}

typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String username,
  required String passwordHash,
  required String passwordSalt,
  required String fullName,
  required String companyName,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> username,
  Value<String> passwordHash,
  Value<String> passwordSalt,
  Value<String> fullName,
  Value<String> companyName,
});

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get passwordSalt => $composableBuilder(
      column: $table.passwordSalt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnFilters(column));
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passwordSalt => $composableBuilder(
      column: $table.passwordSalt,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => column);

  GeneratedColumn<String> get passwordSalt => $composableBuilder(
      column: $table.passwordSalt, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => column);
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> passwordHash = const Value.absent(),
            Value<String> passwordSalt = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> companyName = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            username: username,
            passwordHash: passwordHash,
            passwordSalt: passwordSalt,
            fullName: fullName,
            companyName: companyName,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String username,
            required String passwordHash,
            required String passwordSalt,
            required String fullName,
            required String companyName,
          }) =>
              UsersCompanion.insert(
            id: id,
            username: username,
            passwordHash: passwordHash,
            passwordSalt: passwordSalt,
            fullName: fullName,
            companyName: companyName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    User,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (User, BaseReferences<_$AppDatabase, $UsersTable, User>),
    User,
    PrefetchHooks Function()>;
typedef $$JobsTableCreateCompanionBuilder = JobsCompanion Function({
  Value<int> id,
  required String jobId,
  required String customerName,
  required String address,
  Value<DateTime?> arrivedAt,
});
typedef $$JobsTableUpdateCompanionBuilder = JobsCompanion Function({
  Value<int> id,
  Value<String> jobId,
  Value<String> customerName,
  Value<String> address,
  Value<DateTime?> arrivedAt,
});

final class $$JobsTableReferences
    extends BaseReferences<_$AppDatabase, $JobsTable, Job> {
  $$JobsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JobEquipmentTable, List<JobEquipmentData>>
      _jobEquipmentRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.jobEquipment,
          aliasName: $_aliasNameGenerator(db.jobs.id, db.jobEquipment.jobId));

  $$JobEquipmentTableProcessedTableManager get jobEquipmentRefs {
    final manager = $$JobEquipmentTableTableManager($_db, $_db.jobEquipment)
        .filter((f) => f.jobId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_jobEquipmentRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$JobsTableFilterComposer extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get jobId => $composableBuilder(
      column: $table.jobId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get arrivedAt => $composableBuilder(
      column: $table.arrivedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> jobEquipmentRefs(
      Expression<bool> Function($$JobEquipmentTableFilterComposer f) f) {
    final $$JobEquipmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.jobEquipment,
        getReferencedColumn: (t) => t.jobId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobEquipmentTableFilterComposer(
              $db: $db,
              $table: $db.jobEquipment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$JobsTableOrderingComposer extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get jobId => $composableBuilder(
      column: $table.jobId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customerName => $composableBuilder(
      column: $table.customerName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get arrivedAt => $composableBuilder(
      column: $table.arrivedAt, builder: (column) => ColumnOrderings(column));
}

class $$JobsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobsTable> {
  $$JobsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get jobId =>
      $composableBuilder(column: $table.jobId, builder: (column) => column);

  GeneratedColumn<String> get customerName => $composableBuilder(
      column: $table.customerName, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<DateTime> get arrivedAt =>
      $composableBuilder(column: $table.arrivedAt, builder: (column) => column);

  Expression<T> jobEquipmentRefs<T extends Object>(
      Expression<T> Function($$JobEquipmentTableAnnotationComposer a) f) {
    final $$JobEquipmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.jobEquipment,
        getReferencedColumn: (t) => t.jobId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobEquipmentTableAnnotationComposer(
              $db: $db,
              $table: $db.jobEquipment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$JobsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JobsTable,
    Job,
    $$JobsTableFilterComposer,
    $$JobsTableOrderingComposer,
    $$JobsTableAnnotationComposer,
    $$JobsTableCreateCompanionBuilder,
    $$JobsTableUpdateCompanionBuilder,
    (Job, $$JobsTableReferences),
    Job,
    PrefetchHooks Function({bool jobEquipmentRefs})> {
  $$JobsTableTableManager(_$AppDatabase db, $JobsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> jobId = const Value.absent(),
            Value<String> customerName = const Value.absent(),
            Value<String> address = const Value.absent(),
            Value<DateTime?> arrivedAt = const Value.absent(),
          }) =>
              JobsCompanion(
            id: id,
            jobId: jobId,
            customerName: customerName,
            address: address,
            arrivedAt: arrivedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String jobId,
            required String customerName,
            required String address,
            Value<DateTime?> arrivedAt = const Value.absent(),
          }) =>
              JobsCompanion.insert(
            id: id,
            jobId: jobId,
            customerName: customerName,
            address: address,
            arrivedAt: arrivedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$JobsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({jobEquipmentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (jobEquipmentRefs) db.jobEquipment],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (jobEquipmentRefs)
                    await $_getPrefetchedData<Job, $JobsTable,
                            JobEquipmentData>(
                        currentTable: table,
                        referencedTable:
                            $$JobsTableReferences._jobEquipmentRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$JobsTableReferences(db, table, p0)
                                .jobEquipmentRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.jobId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$JobsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JobsTable,
    Job,
    $$JobsTableFilterComposer,
    $$JobsTableOrderingComposer,
    $$JobsTableAnnotationComposer,
    $$JobsTableCreateCompanionBuilder,
    $$JobsTableUpdateCompanionBuilder,
    (Job, $$JobsTableReferences),
    Job,
    PrefetchHooks Function({bool jobEquipmentRefs})>;
typedef $$EquipmentTableCreateCompanionBuilder = EquipmentCompanion Function({
  Value<int> id,
  required String sku,
  required String name,
  required String category,
  Value<bool> active,
});
typedef $$EquipmentTableUpdateCompanionBuilder = EquipmentCompanion Function({
  Value<int> id,
  Value<String> sku,
  Value<String> name,
  Value<String> category,
  Value<bool> active,
});

final class $$EquipmentTableReferences
    extends BaseReferences<_$AppDatabase, $EquipmentTable, EquipmentData> {
  $$EquipmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$JobEquipmentTable, List<JobEquipmentData>>
      _jobEquipmentRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.jobEquipment,
              aliasName: $_aliasNameGenerator(
                  db.equipment.id, db.jobEquipment.equipmentId));

  $$JobEquipmentTableProcessedTableManager get jobEquipmentRefs {
    final manager = $$JobEquipmentTableTableManager($_db, $_db.jobEquipment)
        .filter((f) => f.equipmentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_jobEquipmentRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$EquipmentTableFilterComposer
    extends Composer<_$AppDatabase, $EquipmentTable> {
  $$EquipmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  Expression<bool> jobEquipmentRefs(
      Expression<bool> Function($$JobEquipmentTableFilterComposer f) f) {
    final $$JobEquipmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.jobEquipment,
        getReferencedColumn: (t) => t.equipmentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobEquipmentTableFilterComposer(
              $db: $db,
              $table: $db.jobEquipment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$EquipmentTableOrderingComposer
    extends Composer<_$AppDatabase, $EquipmentTable> {
  $$EquipmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));
}

class $$EquipmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $EquipmentTable> {
  $$EquipmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  Expression<T> jobEquipmentRefs<T extends Object>(
      Expression<T> Function($$JobEquipmentTableAnnotationComposer a) f) {
    final $$JobEquipmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.jobEquipment,
        getReferencedColumn: (t) => t.equipmentId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobEquipmentTableAnnotationComposer(
              $db: $db,
              $table: $db.jobEquipment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$EquipmentTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EquipmentTable,
    EquipmentData,
    $$EquipmentTableFilterComposer,
    $$EquipmentTableOrderingComposer,
    $$EquipmentTableAnnotationComposer,
    $$EquipmentTableCreateCompanionBuilder,
    $$EquipmentTableUpdateCompanionBuilder,
    (EquipmentData, $$EquipmentTableReferences),
    EquipmentData,
    PrefetchHooks Function({bool jobEquipmentRefs})> {
  $$EquipmentTableTableManager(_$AppDatabase db, $EquipmentTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EquipmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EquipmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EquipmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> sku = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<bool> active = const Value.absent(),
          }) =>
              EquipmentCompanion(
            id: id,
            sku: sku,
            name: name,
            category: category,
            active: active,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String sku,
            required String name,
            required String category,
            Value<bool> active = const Value.absent(),
          }) =>
              EquipmentCompanion.insert(
            id: id,
            sku: sku,
            name: name,
            category: category,
            active: active,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$EquipmentTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({jobEquipmentRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (jobEquipmentRefs) db.jobEquipment],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (jobEquipmentRefs)
                    await $_getPrefetchedData<EquipmentData, $EquipmentTable,
                            JobEquipmentData>(
                        currentTable: table,
                        referencedTable: $$EquipmentTableReferences
                            ._jobEquipmentRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$EquipmentTableReferences(db, table, p0)
                                .jobEquipmentRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.equipmentId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$EquipmentTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EquipmentTable,
    EquipmentData,
    $$EquipmentTableFilterComposer,
    $$EquipmentTableOrderingComposer,
    $$EquipmentTableAnnotationComposer,
    $$EquipmentTableCreateCompanionBuilder,
    $$EquipmentTableUpdateCompanionBuilder,
    (EquipmentData, $$EquipmentTableReferences),
    EquipmentData,
    PrefetchHooks Function({bool jobEquipmentRefs})>;
typedef $$JobEquipmentTableCreateCompanionBuilder = JobEquipmentCompanion
    Function({
  required int jobId,
  required int equipmentId,
  Value<int> quantity,
  Value<int> rowid,
});
typedef $$JobEquipmentTableUpdateCompanionBuilder = JobEquipmentCompanion
    Function({
  Value<int> jobId,
  Value<int> equipmentId,
  Value<int> quantity,
  Value<int> rowid,
});

final class $$JobEquipmentTableReferences extends BaseReferences<_$AppDatabase,
    $JobEquipmentTable, JobEquipmentData> {
  $$JobEquipmentTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $JobsTable _jobIdTable(_$AppDatabase db) => db.jobs
      .createAlias($_aliasNameGenerator(db.jobEquipment.jobId, db.jobs.id));

  $$JobsTableProcessedTableManager get jobId {
    final $_column = $_itemColumn<int>('job_id')!;

    final manager = $$JobsTableTableManager($_db, $_db.jobs)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_jobIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $EquipmentTable _equipmentIdTable(_$AppDatabase db) =>
      db.equipment.createAlias(
          $_aliasNameGenerator(db.jobEquipment.equipmentId, db.equipment.id));

  $$EquipmentTableProcessedTableManager get equipmentId {
    final $_column = $_itemColumn<int>('equipment_id')!;

    final manager = $$EquipmentTableTableManager($_db, $_db.equipment)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_equipmentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$JobEquipmentTableFilterComposer
    extends Composer<_$AppDatabase, $JobEquipmentTable> {
  $$JobEquipmentTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  $$JobsTableFilterComposer get jobId {
    final $$JobsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.jobId,
        referencedTable: $db.jobs,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobsTableFilterComposer(
              $db: $db,
              $table: $db.jobs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EquipmentTableFilterComposer get equipmentId {
    final $$EquipmentTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.equipmentId,
        referencedTable: $db.equipment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EquipmentTableFilterComposer(
              $db: $db,
              $table: $db.equipment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JobEquipmentTableOrderingComposer
    extends Composer<_$AppDatabase, $JobEquipmentTable> {
  $$JobEquipmentTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  $$JobsTableOrderingComposer get jobId {
    final $$JobsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.jobId,
        referencedTable: $db.jobs,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobsTableOrderingComposer(
              $db: $db,
              $table: $db.jobs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EquipmentTableOrderingComposer get equipmentId {
    final $$EquipmentTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.equipmentId,
        referencedTable: $db.equipment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EquipmentTableOrderingComposer(
              $db: $db,
              $table: $db.equipment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JobEquipmentTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobEquipmentTable> {
  $$JobEquipmentTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  $$JobsTableAnnotationComposer get jobId {
    final $$JobsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.jobId,
        referencedTable: $db.jobs,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$JobsTableAnnotationComposer(
              $db: $db,
              $table: $db.jobs,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$EquipmentTableAnnotationComposer get equipmentId {
    final $$EquipmentTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.equipmentId,
        referencedTable: $db.equipment,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$EquipmentTableAnnotationComposer(
              $db: $db,
              $table: $db.equipment,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$JobEquipmentTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JobEquipmentTable,
    JobEquipmentData,
    $$JobEquipmentTableFilterComposer,
    $$JobEquipmentTableOrderingComposer,
    $$JobEquipmentTableAnnotationComposer,
    $$JobEquipmentTableCreateCompanionBuilder,
    $$JobEquipmentTableUpdateCompanionBuilder,
    (JobEquipmentData, $$JobEquipmentTableReferences),
    JobEquipmentData,
    PrefetchHooks Function({bool jobId, bool equipmentId})> {
  $$JobEquipmentTableTableManager(_$AppDatabase db, $JobEquipmentTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobEquipmentTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobEquipmentTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobEquipmentTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> jobId = const Value.absent(),
            Value<int> equipmentId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JobEquipmentCompanion(
            jobId: jobId,
            equipmentId: equipmentId,
            quantity: quantity,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int jobId,
            required int equipmentId,
            Value<int> quantity = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              JobEquipmentCompanion.insert(
            jobId: jobId,
            equipmentId: equipmentId,
            quantity: quantity,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$JobEquipmentTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({jobId = false, equipmentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (jobId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.jobId,
                    referencedTable:
                        $$JobEquipmentTableReferences._jobIdTable(db),
                    referencedColumn:
                        $$JobEquipmentTableReferences._jobIdTable(db).id,
                  ) as T;
                }
                if (equipmentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.equipmentId,
                    referencedTable:
                        $$JobEquipmentTableReferences._equipmentIdTable(db),
                    referencedColumn:
                        $$JobEquipmentTableReferences._equipmentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$JobEquipmentTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JobEquipmentTable,
    JobEquipmentData,
    $$JobEquipmentTableFilterComposer,
    $$JobEquipmentTableOrderingComposer,
    $$JobEquipmentTableAnnotationComposer,
    $$JobEquipmentTableCreateCompanionBuilder,
    $$JobEquipmentTableUpdateCompanionBuilder,
    (JobEquipmentData, $$JobEquipmentTableReferences),
    JobEquipmentData,
    PrefetchHooks Function({bool jobId, bool equipmentId})>;
typedef $$ProposalSignaturesTableCreateCompanionBuilder
    = ProposalSignaturesCompanion Function({
  Value<int> id,
  required int proposalId,
  required Uint8List signaturePng,
  Value<DateTime> signedAt,
});
typedef $$ProposalSignaturesTableUpdateCompanionBuilder
    = ProposalSignaturesCompanion Function({
  Value<int> id,
  Value<int> proposalId,
  Value<Uint8List> signaturePng,
  Value<DateTime> signedAt,
});

class $$ProposalSignaturesTableFilterComposer
    extends Composer<_$AppDatabase, $ProposalSignaturesTable> {
  $$ProposalSignaturesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get proposalId => $composableBuilder(
      column: $table.proposalId, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get signaturePng => $composableBuilder(
      column: $table.signaturePng, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get signedAt => $composableBuilder(
      column: $table.signedAt, builder: (column) => ColumnFilters(column));
}

class $$ProposalSignaturesTableOrderingComposer
    extends Composer<_$AppDatabase, $ProposalSignaturesTable> {
  $$ProposalSignaturesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get proposalId => $composableBuilder(
      column: $table.proposalId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get signaturePng => $composableBuilder(
      column: $table.signaturePng,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get signedAt => $composableBuilder(
      column: $table.signedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProposalSignaturesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProposalSignaturesTable> {
  $$ProposalSignaturesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get proposalId => $composableBuilder(
      column: $table.proposalId, builder: (column) => column);

  GeneratedColumn<Uint8List> get signaturePng => $composableBuilder(
      column: $table.signaturePng, builder: (column) => column);

  GeneratedColumn<DateTime> get signedAt =>
      $composableBuilder(column: $table.signedAt, builder: (column) => column);
}

class $$ProposalSignaturesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProposalSignaturesTable,
    ProposalSignature,
    $$ProposalSignaturesTableFilterComposer,
    $$ProposalSignaturesTableOrderingComposer,
    $$ProposalSignaturesTableAnnotationComposer,
    $$ProposalSignaturesTableCreateCompanionBuilder,
    $$ProposalSignaturesTableUpdateCompanionBuilder,
    (
      ProposalSignature,
      BaseReferences<_$AppDatabase, $ProposalSignaturesTable, ProposalSignature>
    ),
    ProposalSignature,
    PrefetchHooks Function()> {
  $$ProposalSignaturesTableTableManager(
      _$AppDatabase db, $ProposalSignaturesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProposalSignaturesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProposalSignaturesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProposalSignaturesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> proposalId = const Value.absent(),
            Value<Uint8List> signaturePng = const Value.absent(),
            Value<DateTime> signedAt = const Value.absent(),
          }) =>
              ProposalSignaturesCompanion(
            id: id,
            proposalId: proposalId,
            signaturePng: signaturePng,
            signedAt: signedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int proposalId,
            required Uint8List signaturePng,
            Value<DateTime> signedAt = const Value.absent(),
          }) =>
              ProposalSignaturesCompanion.insert(
            id: id,
            proposalId: proposalId,
            signaturePng: signaturePng,
            signedAt: signedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ProposalSignaturesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProposalSignaturesTable,
    ProposalSignature,
    $$ProposalSignaturesTableFilterComposer,
    $$ProposalSignaturesTableOrderingComposer,
    $$ProposalSignaturesTableAnnotationComposer,
    $$ProposalSignaturesTableCreateCompanionBuilder,
    $$ProposalSignaturesTableUpdateCompanionBuilder,
    (
      ProposalSignature,
      BaseReferences<_$AppDatabase, $ProposalSignaturesTable, ProposalSignature>
    ),
    ProposalSignature,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$JobsTableTableManager get jobs => $$JobsTableTableManager(_db, _db.jobs);
  $$EquipmentTableTableManager get equipment =>
      $$EquipmentTableTableManager(_db, _db.equipment);
  $$JobEquipmentTableTableManager get jobEquipment =>
      $$JobEquipmentTableTableManager(_db, _db.jobEquipment);
  $$ProposalSignaturesTableTableManager get proposalSignatures =>
      $$ProposalSignaturesTableTableManager(_db, _db.proposalSignatures);
}
