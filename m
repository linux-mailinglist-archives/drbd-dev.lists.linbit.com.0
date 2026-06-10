Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y1BhGIEbKWoZQwMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jun 2026 10:08:33 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id ECD56666F2D
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Jun 2026 10:08:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=U0c85P2n;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 37951164573;
	Wed, 10 Jun 2026 10:08:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 75734 seconds by postgrey-1.31 at mail19;
	Wed, 10 Jun 2026 10:08:06 CEST
Received: from CH5PR02CU005.outbound.protection.outlook.com
	(mail-northcentralusazon11012025.outbound.protection.outlook.com
	[40.107.200.25])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E446816086B
	for <drbd-dev@lists.linbit.com>; Wed, 10 Jun 2026 10:08:06 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
	b=bNkaqkOVFjhH21ZuywHUPXBUtjF8MTKcgGQkSuhllLLaApRDi3lHVndKNiVfs0FXM2M3qNGH+v2m0jV9beNhm1MXmKjNbxmiphDE5Wsn8puQenWoiUShigfkwILE8Ma/6law4RNI7356xTn7tAufJ2QZZY644CjIoUGlTnLVDS0Dr8CsjReulgC4G3P9gy/8uKWy4Ji65HrrQ3Oiozf3zB3WaLbuKAy7Pmervdcm6dbXpNFjD87xjcSIT79LH5fLwXiYSYLn0xdbvs++HP8fgihyW7HbbPWmBNPiiVDZHkX+Z8UGzNGOuii4tvMnJrJ/20wr+IhNpCGwHgUng+jHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector10001;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=nbGKZZeqXl0I3jIvv4zrXT60WcWn3r0FjCw0D0clQE0=;
	b=sGXlPtLyvs4dX/m6eFTJZAvr/r4bPCXiE1M29MKB1vGdFYKDVr3g/jbyLqxLtnOzSB09XGrpQ6J8lAqaMbjwKOIbSGIdCsTD91X4BmegXpgDJK8/sIl10vfhZaPzO5xgivTE8weNYvw9gjrwt/Ck5TX5zQGwPNZY6hSFhA4I4lxvmokPeH37Y4lVCIp5/o3hYsu2IpNqXUY3z7mZlE+Fcuy/KDDQ/f2O+oe68+NxgDPtMTZiPe+H4i9I1Kv98O3pH8vRzAQvECyCucCf/QDVLkfMBqmJjaZKmusocBC6Fft0nFnF/hhfX+x1rybK1KNBnPodZdj8ZmuoqdpqJrPvdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com;
	dkim=pass header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nbGKZZeqXl0I3jIvv4zrXT60WcWn3r0FjCw0D0clQE0=;
	b=U0c85P2nyNZkhOVpCxmQJoVPTwz8wcKJn6VJZN9yOeHvYxEcBcUiJGpUHg0iDI6WXzYt82Uxnn/aWq2TaOPVPrdhlSUQDqkuKDYrrlMQELrQ3Bq/nq4M3xwDV12GiIR8h1DeuGz6rEQ9OdOMPL62tGfJiqvoWYNIAEEy4vjCLeY=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
	by LV9PR12MB9805.namprd12.prod.outlook.com (2603:10b6:408:2ee::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14;
	Wed, 10 Jun 2026 08:08:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
	([fe80::ce69:cfae:774d:a65c]) by
	PH7PR12MB5685.namprd12.prod.outlook.com
	([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.21.0092.006;
	Wed, 10 Jun 2026 08:08:03 +0000
Message-ID: <6b2efdee-95b0-4306-a682-0d0466497ddb@amd.com>
Date: Wed, 10 Jun 2026 10:07:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/14] list: Prepare entry iterators to cache cursor
	state
To: Kaitao Cheng <kaitao.cheng@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260609061347.93688-1-kaitao.cheng@linux.dev>
	<bd0b7393-8ccb-4d67-8bfc-18c68347122c@amd.com>
	<5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5152089a-2808-4fe9-b633-b03018105dd2@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0196.namprd04.prod.outlook.com
	(2603:10b6:408:e9::21) To PH7PR12MB5685.namprd12.prod.outlook.com
	(2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV9PR12MB9805:EE_
X-MS-Office365-Filtering-Correlation-Id: 85825337-3575-4d69-2f6c-08dec6c76501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
	ARA:13230040|23010399003|366016|1800799024|7416014|376014|5023799004|11063799006|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 5wK+o6SmdROth+udKW36JmZvOpN+fjaHzQbrcYUJyNcEGhiRBssI2SJ0EaD1hNGYXzVREYz+h4BocGjaRx3o/UpjMzYNiBbfcdQw2sN0FzKSPmFdzJAZe2ErKl4F8mYNr+uckBTtzyhJUa+LhhuoJllvGeVpVdPlS6xYnkjIMMoOw88qhPRzsaTD0ALfQ2gb8pGt4gLcVDtf6KqBvEvEFxyhR5Pxn5lsQWq33cp3Jn97kcQJ2OVKyuaNrMhKB5UXwU4ujhhFLHaRbLwVDAJka9bUUgs49eI2seI0786oN26wnPYyKIFFpEkc1awUFIw/AYuV695XIhwo0UgqnmkFptj+GB8Zs4XUxxdZNbNXS9oGq4PtzZE+FSsnZNN/l4/5EUYIWmVVTHy+j+CTIWEjp2gw5s6hJfqh/q09YZdlMY8AYqVO6RDw2aqxC2ulR9rTHAUg3i31OYTvSelzs7GwhfMiTbGul2GmWFdWIHMsRqNlUlRQ9BcjbUL0dsTZH8cRAbORoStyxGuCRhbO06kkTo14ArelDqKVSSnzyVZosNB5awKMTJjYUkivv3e5KtE/L60J/2aI1wJ7LXosqJBT17uCUscx2YLqE2PCqeSqaAuKjmMsgHF6AlVJBByH5SOyvvcmps8zpc0wkf3h40PUMjsaUBq/l06WzyVOpt9A6KMZliU3ANc5HyxI2YmxSjzs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(5023799004)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpBd1o3RDg3bjVDOFprWEZEQmZqaVUweDBhbFArTkd4dGN1TWtkeEtaQXVO?=
	=?utf-8?B?NWpacm0xSW00em5DMVIzb2NxMUxKK3ZBQjRNUnY2WWNtcVlVNlkxd1IrcU1Y?=
	=?utf-8?B?bXdwa1duREZCdDNDQmhaTVkrZW5iMitTV2ljalZhK1k5OGZQZ3NtQ3I3Tktw?=
	=?utf-8?B?S3BxOERxaWdvMmFvVWxoMTZrOGVOQ3h4L2ZYVjUySWYxNVZOa0laMUxzbjhQ?=
	=?utf-8?B?ZnQ0T3VMeHRYYS9qdDQwcUJ5MTVrdUVLL2ZuVmFkZTVuYjlzd2ZGTmdtUzFm?=
	=?utf-8?B?Mm80SHBlUzhjbWg1Zm90eW9JM2F3TjRRajVkckdOaFhyaFNVdmpMM2YvU0RT?=
	=?utf-8?B?eFZGYk9Jc3hUaU9PcXAyUkV2dE43VDdYNGRmdFpnUG55VmZ0NDgwV2lPMlhM?=
	=?utf-8?B?aVQyYUo2Yk5MU1RZNGEzMk00WkJvYzBUbnRxTCt0YXo5Z3BXTHM3aGJsc2tH?=
	=?utf-8?B?T1AzZ3hyeTVBQ2VGOWxSOWs2WUd1MkZqdEF5eGtqZWUwYkQ5QUphZUU5VDBV?=
	=?utf-8?B?bjIvQU1QWU1TRlNnZm03OGRvYmJjZFE5d0RxRFpCRVczeXowZGwyaUNtbGpS?=
	=?utf-8?B?RU9xNG5Ga2pLWVNvcTVybEo2SjliRVhCdTEvOFRXcWV5TG9RVDdHWUplWnlJ?=
	=?utf-8?B?eFpqVnpmUTU5aVFyMnFwVUJKdW9BeWo1UjFKTzI5enF2TEo2MTNTNDhyY0Fx?=
	=?utf-8?B?QVFxbStDMW1NaE5EVGYybG91eDJKTU9wQ2h1Y3l4TVhqTER5N3VLcG8yOXgz?=
	=?utf-8?B?azBqRjlYMVJyLzdMNUovOGpLVGJLUkRJYTgyZmVoUEZtRnZnV3lSMDl5Q1RT?=
	=?utf-8?B?a014SEpDTG40cVdOY3Q0SW5kS3Eya2E4Vi9Oc1FLSHBSbFQ2TWRyMVNpdGFR?=
	=?utf-8?B?VUVsSVE1eFh4dFFicmVHelNWSDhFbUhGK3hFbDhSUFk1cW5SMDNsWW1LTDg0?=
	=?utf-8?B?MGR3MDc0TUE1RjM1aXRLODVGSjVKR1Y2V3QzdXVZd3lYUUhueWtBM0cxK0xM?=
	=?utf-8?B?OWFTc2kvN3B6VEtTN2VRTDI0SFV6TVcrM2loNEN3THdVMmpMTC96c2t1dnc0?=
	=?utf-8?B?WGF4WCtRMWNkS0xhUVFPMndvWHhDWVpnS1kwNDJWTTZlQ0Y4di94cUptV3ZE?=
	=?utf-8?B?YzNIcE5wL0ZrZjl5cEJiMjBVMXhkRjZSWUZMY0o1MnFUa0FtQjluQkQxTTVD?=
	=?utf-8?B?VVJSMng0UkMxc01hbDNxbEZvcVJrVmNKdUF4RitZNU1uVjR3KzJGZjNKYk5S?=
	=?utf-8?B?dVIrb3lFTkJyWFlmQmxqSFJmRzNlYnRKc2d6cUdKN1JDQTdLOW9Zc01GZEEw?=
	=?utf-8?B?WkJIcjFJbGM3UkV3SjFXM05XNS8yZEM5T3NsOE5KOFh3V3lWakJMbUlDajJn?=
	=?utf-8?B?dU9IWE05L2NQd213THRxV05SanR4L3pPQjUzbEgvN2Z0c09NV0JsOTNMbGt2?=
	=?utf-8?B?UEpsbTZNZmdURDcwR1ZRM2NPQTdSTW5mY0VDS2dBUTIrVG5WZFlqRTltTTlj?=
	=?utf-8?B?ZU11WmJZMjlvcWhPeXVEWklBQjZoaEVNUFVZbU5DcVlKcTJ1R05oVVNsRUht?=
	=?utf-8?B?RjBjL0oraHNyOUk4bmY0K1d5YThrRXB6M0trZ3JNTXFjNnF2eUd5RW9LZks3?=
	=?utf-8?B?V2lyRVkybEtJUXJ3ZVpyekYzT1B3dXBmMFFadFJOclhoN2dQNWxYWVJkb2Q5?=
	=?utf-8?B?Y2wxVS95U1BlL3RkLy9haE15NTlVUmdmckVOZmhxWW0xVEtrNkdjQktxVW1o?=
	=?utf-8?B?UWljT0xZUGtQYnJ3UkxKOUFaQ2ZlUjUydEJKcXJpeU45c1h5QmRZeWllZ0sx?=
	=?utf-8?B?N2EyS0lvOHEwVkpqRmYzcE1HVGppOHBrOWRCZjNnSkhHQUZJQ0MxRDJPN1hr?=
	=?utf-8?B?UngwVWhwWTlxS2pFeGpzclVQVlZMMmVMT0lycklYTGRhUTlteVc3MGNicUJ3?=
	=?utf-8?B?OUxqTU9IV2tySnVGQ2FKemx4cmUxa0U4M0EwODM3OHpSaG1HcnNKekRHTk1K?=
	=?utf-8?B?eVNCdUovS29vallVVHZLaTIrV0ZQc1FtZWZlMEtaZFhXODF4VnBuZGZZSGZL?=
	=?utf-8?B?ZEE2aHl4Yy8zVlBtTXhqMnRqcnM2YkhaQmxIVTRmNkRrMHF6K2pLV0Uxc3h0?=
	=?utf-8?B?ZENCR0JUVkRqeUVmOUx4VlYyaVdma0M4Y2lhOG5Qc3A5SVhrMVJJSEtSNFdz?=
	=?utf-8?B?cUhqTGdhalBNdjlubzkxK21IQWpnV3VpNTdtZzV4N1ZPTHNGN0tjWjlXZThW?=
	=?utf-8?B?MmtHVW0vbjdsSmx0MExDRUJaY2lBTC9Ob3g4aVhYdXExMi9iME1BUEJhR1NH?=
	=?utf-8?Q?gICrX7V/d0oA5xIALp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85825337-3575-4d69-2f6c-08dec6c76501
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 08:08:03.0363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1kD1DwgCZ8NV+dNiKiLTLuFtF7gCyir3WjITMUCRWSkOHA9QLpUHImJK7ekUjTo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9805
Cc: Muchun Song <muchun.song@linux.dev>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun@kernel.org>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, Will Deacon <will@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	drbd-dev@lists.linbit.com, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kaito Cheng <chengkaitao@kylinos.cn>, Ingo Molnar <mingo@redhat.com>,
	Matthew Auld <matthew.auld@intel.com>, Waiman Long <longman@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>, intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-block@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	linux-tegra@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	linux1394-devel@lists.sourceforge.net,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	linux-spi@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.61 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,infradead.org,kernel.org,linux.intel.com,linux.ibm.com,foss.st.com,lists.freedesktop.org,vger.kernel.org,redhat.com,nvidia.com,intel.com,ursulin.net,st-md-mailman.stormreply.com,lists.linbit.com,ffwll.ch,stgolabs.net,gmail.com,suse.com,kylinos.cn,linbit.com,bootlin.com,suse.de,kwiboo.se,joshtriplett.org,perex.cz,lists.sourceforge.net,lists.infradead.org,kernel.dk,linaro.org,amd.com,ideasonboard.com,linux-foundation.org,sakamocchi.jp];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kaitao.cheng@linux.dev,m:andriy.shevchenko@linux.intel.com,m:muchun.song@linux.dev,m:peterz@infradead.org,m:boqun@kernel.org,m:joonas.lahtinen@linux.intel.com,m:eajames@linux.ibm.com,m:alexandre.torgue@foss.st.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dhowells@redhat.com,m:ldewangan@nvidia.com,m:andrzej.hajda@intel.com,m:tursulin@ursulin.net,m:will@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:simona@ffwll.ch,m:thierry.reding@kernel.org,m:dave@stgolabs.net,m:rfoss@kernel.org,m:airlied@gmail.com,m:tiwai@suse.com,m:jernej.skrabec@gmail.com,m:jonathanh@nvidia.com,m:chengkaitao@kylinos.cn,m:mingo@redhat.com,m:matthew.auld@intel.com,m:longman@redhat.com,m:philipp.reisner@linbit.com,m:luca.ceresoli@bootlin.com,m:matthew.brost@intel.com,m:tzimmermann@suse.de,m:paulmck@kernel.org,m:jonas@kwiboo.se,m:intel-gfx@lists.freedesktop.org,m:maarten.lankhorst@linux.intel.com,m:josh@joshtriplett.org,m:jani.nikula@linux.intel.com,m:linux
 -block@vger.kernel.org,m:broonie@kernel.org,m:mripard@kernel.org,m:rodrigo.vivi@intel.com,m:linux-tegra@vger.kernel.org,m:perex@perex.cz,m:linux1394-devel@lists.sourceforge.net,m:lars.ellenberg@linbit.com,m:linux-arm-kernel@lists.infradead.org,m:axboe@kernel.dk,m:neil.armstrong@linaro.org,m:brauner@kernel.org,m:rdunlap@infradead.org,m:linux-sound@vger.kernel.org,m:lgirdwood@gmail.com,m:linux-spi@vger.kernel.org,m:ray.huang@amd.com,m:skomatineni@nvidia.com,m:Laurent.pinchart@ideasonboard.com,m:mcoquelin.stm32@gmail.com,m:akpm@linux-foundation.org,m:o-takashi@sakamocchi.jp,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,kylinos.cn:email,mail19.linbit.com:rdns,mail19.linbit.com:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECD56666F2D

On 6/10/26 08:14, Kaitao Cheng wrote:
> 在 2026/6/9 18:33, Christian König 写道:
>> On 6/9/26 08:13, Kaitao Cheng wrote:
>>> From: Kaito Cheng <chengkaitao@kylinos.cn>
>>>
>>> This series prepares for, and then updates, the list_for_each_entry()
>>> family so the common entry iterators cache their next or previous cursor
>>> before the loop body runs.
>>
>> Why in the world would we want to do that?
>>
>> The safe and non-safe variants have very distinct use cases and that is completely intentional.
>>
>> What we could improve maybe is the documentation, from my experience an astonishing large amount of people have misconceptions about the safe variants.
>>
>>> The first 13 patches open-code loops that intentionally depend on the
>>> old "derive the next entry from the current cursor at the end of the
>>> iteration" behaviour.  These loops append work to the list being walked,
>>> restart traversal after dropping a lock, skip an entry consumed by the
>>> current iteration, or otherwise adjust the cursor in the loop body.
>>
>> Well I have to clearly reject the changes for subsystems/components I'm maintaining, that just looks horrible to me and I clearly don't see a good reason for that.
> 
> Hi Christian and Andy Shevchenko,
> 
> Thanks for taking a look. I would like to clarify the point you raised.
> 
> The reason I started looking at this is the original motivation behind
> the _safe() variants.  They exist because some users need to remove, move
> or otherwise consume the current entry while walking the list.  In that
> case the next cursor has to be preserved before the loop body can modify
> the current entry.
> 
> The unfortunate part is that this could not be expressed with the
> existing list_for_each_entry() interface without changing its calling
> convention.  The _safe() variants had to grow an extra argument for the
> temporary cursor, and that is why we ended up with a separate family of
> macros.
> 
> But conceptually, the distinction does not have to be exposed as two
> different iterator families forever.  The difference is an implementation
> detail: whether the iterator keeps the next/previous cursor before the
> body runs.  This series makes the common list_for_each_entry() iterators
> do that internally, so the safe and non-safe forms can effectively be
> folded together, or at least the need for a separate public _safe()
> interface becomes much weaker.
> 
> There is also a usability issue with the current _safe() interface.  The
> caller is forced to define a temporary cursor outside the macro and pass
> it in, even though almost all users never use that cursor directly.  It is
> just boilerplate required by the macro implementation.  I find that
> redundant and awkward: the temporary cursor is an internal detail of the
> iteration, but every caller has to spell it out.
> 
> With the updated list_for_each_entry() implementation, that extra cursor
> can be kept inside the iterator itself.  Callers that only want to walk
> the list, including callers that delete or consume the current entry, no
> longer need to carry an otherwise-unused temporary variable just to make
> the macro work.

Well the distinction between list_for_each_entry() and list_for_each_entry_safe() is *not* there because you need an extra variable to hold the next pointer, but because just 'iterating the list' and 'iterating the list while you modify it' are two distinct use cases.

Apart from the technical implications this also has some documentation value for the code using it.

What we could consider with C99 at hand is to have _safe() variants who uses a local hidden variable to hold the next element.

Or maybe come up with a better name instead of _safe() because people seem to misunderstand that quite often.

But mangling the two use cases together just because it is now technical possible is among the worst ideas I've ever heard.

Regards,
Christian.
