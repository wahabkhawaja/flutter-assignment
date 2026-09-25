class User {
  const User({
    required this.email,
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.phone,
    this.profileImage,
    this.role,
    this.isStaff,
    this.profile,
    this.status,
    this.emailVerified,
    this.phoneVerified,
    this.authProvider,
    this.hasGoogleCalendar,
    this.emailEnabled,
    this.fcmEnabled,
    this.totpEnabled,
    this.unreadMessagesCount,
    this.businessId,
    this.rolePermissions = const [],
    this.accessList,
    this.createdAt,
    this.isVerified,
    this.isActive,
  });

  final String? id;
  final String email;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? profileImage;
  final String? role;
  final bool? isStaff;
  final UserProfile? profile;
  final String? status;
  final bool? emailVerified;
  final bool? phoneVerified;
  final String? authProvider;
  final bool? hasGoogleCalendar;
  final bool? emailEnabled;
  final bool? fcmEnabled;
  final bool? totpEnabled;
  final int? unreadMessagesCount;
  final String? businessId;
  final List<RolePermission> rolePermissions;
  final List<dynamic>? accessList;
  final String? createdAt;
  final bool? isVerified;
  final bool? isActive;

  factory User.fromJson(Map<String, dynamic> json) {
    List<RolePermission> permissions = [];
    if (json['role_permissions'] is List) {
      for (var item in json['role_permissions']) {
        permissions.add(RolePermission.fromJson(Map<String, dynamic>.from(item)));
      }
    }

    return User(
      id: json['id']?.toString(),
      email: json['email']?.toString() ?? '',
      name: json['name']?.toString(),
      firstName: json['first_name']?.toString(),
      lastName: json['last_name']?.toString(),
      phone: json['phone']?.toString(),
      profileImage: json['profile_image']?.toString(),
      role: json['role']?.toString(),
      isStaff: json['is_staff'] == true,
      profile: json['profile'] is Map
          ? UserProfile.fromJson(Map<String, dynamic>.from(json['profile']))
          : null,
      status: json['status']?.toString(),
      emailVerified: json['email_verified'] == true,
      phoneVerified: json['phone_verified'] == true,
      authProvider: json['auth_provider']?.toString(),
      hasGoogleCalendar: json['has_google_calendar'] == true,
      emailEnabled: json['email_enabled'] == true,
      fcmEnabled: json['fcm_enabled'] == true,
      totpEnabled: json['totp_enabled'] == true,
      unreadMessagesCount: json['unread_messages_count'] is num
          ? (json['unread_messages_count'] as num).toInt()
          : null,
      businessId: json['business_id']?.toString(),
      rolePermissions: permissions,
      accessList: json['access_list'] is List ? List<dynamic>.from(json['access_list']) : null,
      createdAt: json['created_at']?.toString(),
      isVerified: json['is_verified'] == true,
      isActive: json['is_active'] == true,
    );
  }
}

class RolePermission {
  const RolePermission({required this.permission, this.value = const []});

  final String permission;
  final List<String> value;

  factory RolePermission.fromJson(Map<String, dynamic> json) {
    List<String> actions = [];
    if (json['value'] is List) {
      for (var item in json['value']) {
        actions.add(item.toString());
      }
    }

    return RolePermission(
      permission: json['permission']?.toString() ?? '',
      value: actions,
    );
  }
}

class UserProfile {
  const UserProfile({
    this.id,
    this.businessName,
    this.venueListings = const [],
    this.mustChoosePlan,
    this.subscription,
    this.launchPartnerPlanSubscriptions,
    this.isClaimed,
    this.hasSubscription,
    this.flatFeePaid,
    this.flatFee,
    this.paymentRequired,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? businessName;
  final List<VenueListing> venueListings;
  final bool? mustChoosePlan;
  final dynamic subscription;
  final dynamic launchPartnerPlanSubscriptions;
  final bool? isClaimed;
  final bool? hasSubscription;
  final bool? flatFeePaid;
  final double? flatFee;
  final bool? paymentRequired;
  final String? createdAt;
  final String? updatedAt;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    List<VenueListing> venues = [];
    if (json['venue_listings'] is List) {
      for (var item in json['venue_listings']) {
        venues.add(VenueListing.fromJson(Map<String, dynamic>.from(item)));
      }
    }

    return UserProfile(
      id: json['id']?.toString(),
      businessName: json['business_name']?.toString(),
      venueListings: venues,
      mustChoosePlan: json['must_choose_plan'] == true,
      subscription: json['subscription'],
      launchPartnerPlanSubscriptions: json['launch_partner_plan_subscriptions'],
      isClaimed: json['is_claimed'] == true,
      hasSubscription: json['has_subscription'] == true,
      flatFeePaid: json['flat_fee_paid'] == true,
      flatFee: json['flat_fee'] is num ? (json['flat_fee'] as num).toDouble() : null,
      paymentRequired: json['payment_required'] == true,
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}

class VenueListing {
  const VenueListing({
    this.id,
    this.slug,
    this.isCompleted,
    this.location,
    this.pricing,
    this.createdAt,
  });

  final String? id;
  final String? slug;
  final bool? isCompleted;
  final VenueLocation? location;
  final VenuePricing? pricing;
  final String? createdAt;

  factory VenueListing.fromJson(Map<String, dynamic> json) {
    return VenueListing(
      id: json['id']?.toString(),
      slug: json['slug']?.toString(),
      isCompleted: json['is_completed'] == true,
      location: json['location'] is Map
          ? VenueLocation.fromJson(Map<String, dynamic>.from(json['location']))
          : null,
      pricing: json['pricing'] is Map
          ? VenuePricing.fromJson(Map<String, dynamic>.from(json['pricing']))
          : null,
      createdAt: json['created_at']?.toString(),
    );
  }
}

class VenueLocation {
  const VenueLocation({
    this.id,
    this.venueId,
    this.country,
    this.city,
    this.streetAddress,
    this.suite,
    this.zipCode,
    this.latitude,
    this.longitude,
    this.isActive,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  final String? id;
  final String? venueId;
  final String? country;
  final String? city;
  final String? streetAddress;
  final String? suite;
  final String? zipCode;
  final double? latitude;
  final double? longitude;
  final bool? isActive;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;

  factory VenueLocation.fromJson(Map<String, dynamic> json) {
    return VenueLocation(
      id: json['id']?.toString(),
      venueId: json['venue_id']?.toString(),
      country: json['country']?.toString(),
      city: json['city']?.toString(),
      streetAddress: json['street_address']?.toString(),
      suite: json['suite']?.toString(),
      zipCode: json['zip_code']?.toString(),
      latitude: json['latitude'] is num ? (json['latitude'] as num).toDouble() : null,
      longitude: json['longitude'] is num ? (json['longitude'] as num).toDouble() : null,
      isActive: json['is_active'] == true,
      isDeleted: json['is_deleted'] == true,
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}

class VenuePricing {
  const VenuePricing({
    this.id,
    this.hourlyRate,
    this.dailyRate,
    this.overnightAllowed,
    this.currencyId,
  });

  final String? id;
  final double? hourlyRate;
  final double? dailyRate;
  final bool? overnightAllowed;
  final String? currencyId;

  factory VenuePricing.fromJson(Map<String, dynamic> json) {
    return VenuePricing(
      id: json['id']?.toString(),
      hourlyRate: json['hourly_rate'] is num ? (json['hourly_rate'] as num).toDouble() : null,
      dailyRate: json['daily_rate'] is num ? (json['daily_rate'] as num).toDouble() : null,
      overnightAllowed: json['overnight_allowed'] == true,
      currencyId: json['currency_id']?.toString(),
    );
  }
}
