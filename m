Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4444C7AA6
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 21:40:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 112D1421787;
	Mon, 28 Feb 2022 21:40:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1961 seconds by postgrey-1.31 at mail19;
	Mon, 28 Feb 2022 21:40:14 CET
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 386C7421784
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 21:40:13 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gL9OvQXRZlLdS0nWu38zKJUPGpd8Lw1yhpw0d+9zMnw5veNcCSl+j10Lj2ZBjoB5CfikiNko3OGYPd5ME3Vpnpr6n3gUYUUXyI/nkCpK1pboNWydXnK5jyRh9RlwUC2J4LqkRcYIcUEdvbcAPOtxCPnt41mkj7xD+m15Kvaf2q7v/g8rWPGCeIDynZ/oNm9fnv9Ju75vK4G9aE6aBcPLDtlUp1ST1JK7/NKF82SiZ4n1XSg+J4DKH5YpYNZ2xk39/JLPCrAzvhJAKKUntlEf2q3g2Pj1J5/dfEOPCBMx04zbq/GH674VvLGDrCGvs5qux8fGUlsbgRV2o3e8r2NFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=1cP3BgbbNuGDusjcZMNEuDHV1LUQdbelhp6M0fWPy5M=;
	b=jdvC0+wMuIjUshRFXNDwX32c2zskPNpWzUT0ktJHw/5EiOrhAsU94pzDNGLqksNFWg+blmisV1k0kohfJdS4O05gRW7IHqVrOqq+Mv5c+HjZN3GrTnkeTf8cvr5w9XQlSh1NpbpQV9SfTtNox7n0FzrCxGIn2Y97pJ0Ozwd2zkUTZZwzZzxBKK4GvrZ+BR8TCxc8QZ0nYFwhOXfRlKMAnTFtySBUzXq/5mIt6py7gbpk+GQ1GQytDDsZI5lf5E8qHWfr02zFw9K3Qsuz9W3QSbnWtzK3Tll4VEq5yh73hCY4N6sQ7OaGkztdVoBWliieGcToSd9yyiqDpPsytzNReg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com;
	dkim=pass header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1cP3BgbbNuGDusjcZMNEuDHV1LUQdbelhp6M0fWPy5M=;
	b=yR2JVvc5BtwSjUOODC9WmjehMXRGxzHYe8ljFxqZPlt6ZskvnNvnIoLUWVTSqL4Nvnz3mlJ6Vj4yuzWXjUdfSbDpZboDHZVxGObnXC8gvFtZZmR10HmqPv3h4fJHh1C2OVQ9oxctvZyNbcFFjGdzd7Nu0zIl+DqaxiZBFvhDfEY=
Authentication-Results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
	by CY4PR12MB1352.namprd12.prod.outlook.com (2603:10b6:903:3a::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26;
	Mon, 28 Feb 2022 20:07:16 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
	([fe80::e03f:901a:be6c:b581]) by
	BN8PR12MB3587.namprd12.prod.outlook.com
	([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.027;
	Mon, 28 Feb 2022 20:07:16 +0000
Message-ID: <282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
Date: Mon, 28 Feb 2022 21:07:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.5.0
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
X-ClientProxiedBy: AM6P195CA0084.EURP195.PROD.OUTLOOK.COM
	(2603:10a6:209:86::25) To BN8PR12MB3587.namprd12.prod.outlook.com
	(2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4780f435-f0f8-4e6e-4169-08d9faf5eaa6
X-MS-TrafficTypeDiagnostic: CY4PR12MB1352:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1352374DF851D24C14A1673183019@CY4PR12MB1352.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfwKM4Ph3ffnU0p23PH6MmiWNssrAz4krll5evTSfx5ow0w1waswCyvqds83nXv/vKDqYeZ4nJPcE+5c6efbm9H+KF/V2vkIMjot7L3c4MJ2NUhhEHsU61Ft6hDBrl1jcnh9EapZmPmwTsw6ESVHpQs83QWblnrflHE+8n0pBPJGvO3BeOdLsq6sLykuPS1jfG+7mtvc1cC2b1biubmL14GLB/Sibk/qCZsfJd+KpT79kHhBzhYli4e6xf6Wf1XCotcM5PIbpVyqjZVKnKalewT7P85o/5nImHgkRdBqjmpldKbagBWNo3eLeex+hQocJ+uVVSXcSY7JFayKRxGcjUSrsgMDZrXESXUUKqA2mcVUrfGKkMgocWawoVlaIc8zSfyMrNNe3nWuqcEl1nUJv4F1V5m9d4aOTKdWVZb54C0D9BwOD0vvihgr/d8C1eTPDO8I+2XuopCbxIp48N14+nqKgxqddT9BQavA6sWNymzE8JSwtOP120c3NQbuDtR+2v/o2/9Bmx4GJDnVOim+gwVs91eOOaI51wF7Cfho1hyg5C8uiYQPM6RQIxlrMbnSX2DiyJmm7nOua0x6ZP0Vf9uP9VSnVikg0lwLJsx/nXxnp4VUactFuFQvm+o20VuEseTDTm8ixZYbdKCR2VF37spoXVt05gbXrIjEYGT1QRdZxRJAOxMWU/f0TemCgmhtJDDJ8n2ceV4KZQ7pwCR8VpLyLtZo05+32aCrevz7uZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(7406005)(86362001)(7366002)(7416002)(5660300002)(31696002)(2616005)(8936002)(316002)(6512007)(8676002)(66556008)(66476007)(66946007)(4326008)(2906002)(186003)(6506007)(53546011)(36756003)(66574015)(6486002)(6666004)(6916009)(83380400001)(508600001)(54906003)(38100700002)(31686004)(43740500002)(45980500001);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVk3ZlI0aHd3U2MzRTQ0QkwvaWlpT1JkYWNicURJVHg1U3BkTWNEbjhxamVK?=
	=?utf-8?B?QWRpaER3c01nNWcwcXBWTjRqeDQyYVJjR01sZFUrd0FKbCswZXRYc2luTWRr?=
	=?utf-8?B?M3BRcmp2MmtvUEVxUEdJSU1YbXUvY3l2T0VlbW04TFVkM3ZVU0NacEJvOFMx?=
	=?utf-8?B?UjkxWGRjNVgxcENNZFFFTFJUbHA1Mzg1WStJMzRDb21zcUNmMitra3lES1Nj?=
	=?utf-8?B?dWxXV25UQW1NTHhKRnpweCsxZldJWGRmc3NwSU1ldFlmZnhaY3ZLbmNNSktv?=
	=?utf-8?B?a3RpQ2VhQUZDbTkyQTdRVkd6K09STzZTQ040TFU1NDZ6c3NBamFnQ3JWN3JR?=
	=?utf-8?B?R0taZkgwQzc0Q3VKRDJ5d21lNmdNRWtCNmlEVS9HRko3RXFNdzNReE4rVUVM?=
	=?utf-8?B?ZllFWDNjK3B5Wml4N0twOVNqOURNSXpNMVVra1hibUw0S2o5dnlIQzQzL2xh?=
	=?utf-8?B?QUY5WGZhODlMQXcxUTBDMGtBTjdsUHp1UFBlQVJBQUV2NklCMi92TEMzaS9O?=
	=?utf-8?B?Mmgra1dvQVh4SUoybk9IUzVSTWVlUTJaUnM1UmlhRE0vM0J5TWIrRldsNjhO?=
	=?utf-8?B?T0EvbFZlTHNWUnIxRkVIVllMTFRjTWhXTFNEQXJLZnNtSVcvaWthRHRLN3RJ?=
	=?utf-8?B?dTZtNzhuTSs4YXJhNDJLTHhnUThLSWE0VS9VSGlzQTFoN3AwSGR5RTNLWklk?=
	=?utf-8?B?aklyWXZyQ21pWFIwaGNJQW1wc2R4RGx2UDczeDJqcXh1S253WFhqVm9DeGt0?=
	=?utf-8?B?cUZncHozM0VOYllMWXdnaWRSNDhFczlIKzZVd1Fia1Q4b1M4T0hyQVIxTVdp?=
	=?utf-8?B?a0tFZzBzY1ZEemlqM2JmR1UrSlhoeDdLSUQ4c0VnaDMxZDJRS3hVM0I0dXlP?=
	=?utf-8?B?MGVzeVhzTlU1U0VSN0tBOC9CcUVkQjk5bm53STJsVFRBKzVoQVdUSUVmTDZm?=
	=?utf-8?B?UjBMYmIzR3VTWWszR2JtN0padGQyNitIbTlONXdPbUlsa1J4ckpEYnlRYlEv?=
	=?utf-8?B?WStUT2VxTHRWQmpVTDdlZ3pPWktOT1djUkU1QkhyK1lzeFJqOEJsWEFDcXpE?=
	=?utf-8?B?ZndXZE9saWpOMXBrUEtFbW0vZWpNNzY0ME1JNkp2NUZtNUtYMnY0eDlOWmFM?=
	=?utf-8?B?RlhQQzA1WXgrOG0yUUE4K0FOVkpIalp0RVF5WDYzbzlkcHNkb3ZNck5ZelpZ?=
	=?utf-8?B?bFBqeHVWekdheTRrL25YVG14OXdoNldjQkpkSTJIZ3l2aE05RDRaUThHNU1F?=
	=?utf-8?B?TGxBU1hIaHJIL3l5dVZsYVZNYTRyVDNJektucmlndUw0bFpVYkxTdGVCZURt?=
	=?utf-8?B?R082dmllRUlwYWY1SFlXYWVlSUErc3h2TkVSWXFYbWFMa1p4bFJLeUQvbUlB?=
	=?utf-8?B?Tm9WWjNWck9Nc2czQjJJajRDM2VvWG5BVWkyVGdxN1Y1YW51T2VFbjB4TmJK?=
	=?utf-8?B?V3BzNkpPaWpWemNRMlo0Zmpzdkt1MkJPQ1ZjOTRhTUZuSU9vQ0VlZkc0SHRy?=
	=?utf-8?B?VllCelFZSExvNEU5eW42SkoyOWZoc2RwLzFvaFZrVk5TYlZpeWllYi9DVDdF?=
	=?utf-8?B?VWJUZW02SU9hUjNud0RGdFhHS2VCVndtem1ycWtEVzFWY1dJT1JQb2lSRG9K?=
	=?utf-8?B?YTdOYVVINmNwOUVqZHREdTJyTnVWQ0p2Q2hPcEVyVHp1TzdXU2lPQ2NIWFcz?=
	=?utf-8?B?Z0xsNEo5VkVnSjlHb1c3Y3lvVGVtbjduOVJqRWlMRU02ZXBzZkdodkQ5Qjgw?=
	=?utf-8?B?SWRwZWlGckFDaG1zeEdoOHoramREZElwY1gwTW94V0daOGJDMUVDb1RocVVZ?=
	=?utf-8?B?T3daenQwci9BS08vUkhMR2tyaldua2dHUDNwV3IyaU90SC94eEp6a0h5a2hi?=
	=?utf-8?B?cGwvdkMySkY1Y3RZcEZzWkZQVGZEK280TnhaeTFMODlLdWNPUW9SVGZYNDZP?=
	=?utf-8?B?M3o4eHMxMWxlck13OHdWTEpMRnBuVDhMTUJkM244S2YrS3RPZ1RFR0NxNjA0?=
	=?utf-8?B?WFYxM1psMUpEWmpUYVVZdzk2alNEN3V5RmJaUzdGelcxVVp3TFlLVjFlWklJ?=
	=?utf-8?B?eFJIbHcwRjdRZ2pRK0lkbStvQ3I5MVNJWlUzM0g4N0lWTktxTDRySmZDZ1Yv?=
	=?utf-8?B?Yit3VlkwT0NvQ0RqODM0SjlyNVk1cTRrYjRUUDRROFBlZXkzdkh0Umk1V09L?=
	=?utf-8?Q?8uoT/2QhUUvglQjhlKjPyEE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4780f435-f0f8-4e6e-4169-08d9faf5eaa6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 20:07:16.2675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9i/3JKdvHOc+ANDAjhzus2inu3JjqQ65q85KPxov4Nf4LQL0qSpalNxmpuhhtHy3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1352
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
	alsa-devel@alsa-project.org, KVM list <kvm@vger.kernel.org>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos,
	H.J." <h.j.bos@vu.nl>, linux1394-devel@lists.sourceforge.net,
	drbd-dev@lists.linbit.com, linux-arch <linux-arch@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, linux-staging@lists.linux.dev,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
	Linux PM <linux-pm@vger.kernel.org>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, dma <dmaengine@vger.kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	v9fs-developer@lists.sourceforge.net,
	linux-tegra <linux-tegra@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-sgx@vger.kernel.org, linux-block <linux-block@vger.kernel.org>,
	Netdev <netdev@vger.kernel.org>, linux-usb@vger.kernel.org,
	samba-technical@lists.samba.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-mediatek@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [Drbd-dev] [PATCH 2/6] treewide: remove using list iterator
 after loop body as a ptr
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

QW0gMjguMDIuMjIgdW0gMjA6NTYgc2NocmllYiBMaW51cyBUb3J2YWxkczoKPiBPbiBNb24sIEZl
YiAyOCwgMjAyMiBhdCA0OjE5IEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPiB3cm90ZToKPj4gSSBkb24ndCB0aGluayB0aGF0IHVzaW5nIHRoZSBleHRyYSB2
YXJpYWJsZSBtYWtlcyB0aGUgY29kZSBpbiBhbnkgd2F5Cj4+IG1vcmUgcmVsaWFibGUgb3IgZWFz
aWVyIHRvIHJlYWQuCj4gU28gSSB0aGluayB0aGUgbmV4dCBzdGVwIGlzIHRvIGRvIHRoZSBhdHRh
Y2hlZCBwYXRjaCAod2hpY2ggcmVxdWlyZXMKPiB0aGF0ICItc3RkPWdudTExIiB0aGF0IHdhcyBk
aXNjdXNzZWQgaW4gdGhlIG9yaWdpbmFsIHRocmVhZCkuCj4KPiBUaGF0IHdpbGwgZ3VhcmFudGVl
IHRoYXQgdGhlICdwb3MnIHBhcmFtZXRlciBvZiBsaXN0X2Zvcl9lYWNoX2VudHJ5KCkKPiBpcyBv
bmx5IHVwZGF0ZWQgSU5TSURFIHRoZSBmb3JfZWFjaF9saXN0X2VudHJ5KCkgbG9vcCwgYW5kIGNh
biBuZXZlcgo+IHBvaW50IHRvIHRoZSAod3JvbmdseSB0eXBlZCkgaGVhZCBlbnRyeS4KPgo+IEFu
ZCBJIHdvdWxkIGFjdHVhbGx5IGhvcGUgdGhhdCBpdCBzaG91bGQgYWN0dWFsbHkgY2F1c2UgY29t
cGlsZXIKPiB3YXJuaW5ncyBhYm91dCBwb3NzaWJseSB1bmluaXRpYWxpemVkIHZhcmlhYmxlcyBp
ZiBwZW9wbGUgdGhlbiB1c2UgdGhlCj4gJ3BvcycgcG9pbnRlciBvdXRzaWRlIHRoZSBsb29wLiBF
eGNlcHQKPgo+ICAgKGEpIHRoYXQgY29kZSBpbiBzZ3gvZW5jbC5jIGN1cnJlbnRseSBpbml0aWFs
aXplcyAndG1wJyB0byBOVUxMIGZvcgo+IGluZXhwbGljYWJsZSByZWFzb25zIC0gcG9zc2libHkg
YmVjYXVzZSBpdCBhbHJlYWR5IGV4cGVjdGVkIHRoaXMKPiBiZWhhdmlvcgo+Cj4gICAoYikgd2hl
biBJIHJlbW92ZSB0aGF0IE5VTEwgaW5pdGlhbGl6ZXIsIEkgc3RpbGwgZG9uJ3QgZ2V0IGEgd2Fy
bmluZywKPiBiZWNhdXNlIHdlJ3ZlIGRpc2FibGVkIC1Xbm8tbWF5YmUtdW5pbml0aWFsaXplZCBz
aW5jZSBpdCByZXN1bHRzIGluIHNvCj4gbWFueSBmYWxzZSBwb3NpdGl2ZXMuCj4KPiBPaCB3ZWxs
Lgo+Cj4gQW55d2F5LCBnaXZlIHRoaXMgcGF0Y2ggYSBsb29rLCBhbmQgYXQgbGVhc3QgaWYgaXQn
cyBleHBhbmRlZCB0byBkbwo+ICIocG9zKSA9IE5VTEwiIGluIHRoZSBlbnRyeSBzdGF0ZW1lbnQg
Zm9yIHRoZSBmb3ItbG9vcCwgaXQgd2lsbCBhdm9pZAo+IHRoZSBIRUFEIHR5cGUgY29uZnVzaW9u
IHRoYXQgSmFrb2IgaXMgd29ya2luZyBvbi4gQW5kIEkgdGhpbmsgaW4gYQo+IGNsZWFuZXIgd2F5
IHRoYW4gdGhlIGhvcnJpZCBnYW1lcyBoZSBwbGF5cy4KPgo+IChCdXQgaXQgd29uJ3QgYXZvaWQg
cG9zc2libGUgQ1BVIHNwZWN1bGF0aW9uIG9mIHN1Y2ggdHlwZSBjb25mdXNpb24uCj4gVGhhdCwg
aW4gbXkgb3BpbmlvbiwgaXMgYSBjb21wbGV0ZWx5IGRpZmZlcmVudCBpc3N1ZSkKClllcywgY29t
cGxldGVseSBhZ3JlZS4KCj4gSSBkbyB3aXNoIHdlIGNvdWxkIGFjdHVhbGx5IHBvaXNvbiB0aGUg
J3BvcycgdmFsdWUgYWZ0ZXIgdGhlIGxvb3AKPiBzb21laG93IC0gYnV0IGNsZWFybHkgdGhlICJt
aWdodCBiZSB1bmluaXRpYWxpemVkIiBJIHdhcyBob3BpbmcgZm9yCj4gaXNuJ3QgdGhlIHdheSB0
byBkbyBpdC4KPgo+IEFueWJvZHkgaGF2ZSBhbnkgaWRlYXM/CgpJIHRoaW5rIHdlIHNob3VsZCBs
b29rIGF0IHRoZSB1c2UgY2FzZXMgd2h5IGNvZGUgaXMgdG91Y2hpbmcgKHBvcykgYWZ0ZXIgCnRo
ZSBsb29wLgoKSnVzdCBmcm9tIHNraW1taW5nIG92ZXIgdGhlIHBhdGNoZXMgdG8gY2hhbmdlIHRo
aXMgYW5kIGV4cGVyaWVuY2Ugd2l0aCAKdGhlIGRyaXZlcnMvc3Vic3lzdGVtcyBJIGhlbHAgdG8g
bWFpbnRhaW4gSSB0aGluayB0aGUgcHJpbWFyeSBwYXR0ZXJuIApsb29rcyBzb21ldGhpbmcgbGlr
ZSB0aGlzOgoKbGlzdF9mb3JfZWFjaF9lbnRyeShlbnRyeSwgaGVhZCwgbWVtYmVyKSB7CiDCoMKg
wqAgaWYgKHNvbWVfY29uZGl0aW9uX2NoZWNraW5nKGVudHJ5KSkKIMKgwqDCoCDCoMKgwqAgYnJl
YWs7Cn0KZG9fc29tZXRoaW5nX3dpdGgoZW50cnkpOwoKU28gdGhlIHNvbHV0aW9uIHNob3VsZCBw
cm9iYWJseSBub3QgYmUgdG8gY2hhbmdlIGFsbCB0aG9zZSB1c2UgY2FzZXMgdG8gCnVzZSBtb3Jl
IHRlbXBvcmFyeSB2YXJpYWJsZXMsIGJ1dCByYXRoZXIgdG8gYWRkIGEgbGlzdF9maW5kX2VudHJ5
KC4uLiwgCmNvbmRpdGlvbikgbWFjcm8gYW5kIGNvbnNpc3RlbnRseSB1c2UgdGhhdCBvbmUgaW5z
dGVhZC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiAgICAgICAgICAgICAgICAgIExpbnVzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBt
YWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJp
dC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
