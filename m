Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E35734C7E69
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 00:30:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD6EB421799;
	Tue,  1 Mar 2022 00:30:22 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4879B421790
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 00:30:21 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=L/NM+bF14zNbxvoixIfkS2nlK+oJNZgO88SKo9/g1KV0Oppam+GcEU2z0EELA9icO2x7c3StRZD+L5XsZvoXEnl6PVLy/BIj03Rje9tsqm2Ogz9TwVR1kU+53DaXvxnzUV10pBbsFtvcZwTeBhSG5XoHnJ8AtezvTjvVZ+2TiB9uphyUEY/t24uIvqfyDUFCcgJCUpyHWOpJrR+O1dKUBn8md08+2khFGXaCsRFoWVfX9Slai8UfHsjWVfJ274s6ToF6OK37ofjceMEyl+JvbNk/vruU+USQH//wPl2L3BuMH7xMKM4eMkb3SmKECd2NCkixzeLvRrCQut0OSRx99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=ioAqKXomsn7wJ84HI4fb0DepRBkYi6WqaGp150Ttg2U=;
	b=T+ZcZH/bBpZ+/CLoWiUxVhW3F7zcM5cWbJQWWzlPhuBNKYsC+nq97shvp9GPgIpj6aaj6U6gv98BPPUKBXiT3IeU0irbt/+GqfQkxDkqiJPA/VMsux5QFicJjkgsjmO6vZeHDjDGPYG5gkKFzRiIaaTAiP6sRNqKQEH985GD7HmJkZvvccPJteTd5sxq7n68JUuM0k7K1NN+JJMb0v+tcDo/yRnEDZ/MOVnU1seNYn8ygl3Q0AKTYwFLoch+9bIaoZF4+y77T/lYaP7nL1ePt31PJdS7ZO3ZdJ7/UOvJoxwxLxcWM1aFZTXzr8CuOgIEAvCOIqjVXbXITmYsUpjtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com;
	dkim=pass header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ioAqKXomsn7wJ84HI4fb0DepRBkYi6WqaGp150Ttg2U=;
	b=cnkurhixi6Q0xE7CYbTE0c8h4t9U6Rc/k8FYCxzvDE/7+IXSTpOXtRr4lrrTSxZx0zypJ5EpTZXbGAS+vcCZf5RO251cY+h1wjtjMXqGX0qJfzaX2lp0Jg8BTVshgmVq3QwrytEK2sRR4a159vv7KuqWvUIDME3Q0beBcK5Djlo=
Authentication-Results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
	by MWHPR12MB1358.namprd12.prod.outlook.com (2603:10b6:300:d::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22;
	Mon, 28 Feb 2022 20:56:55 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
	([fe80::e03f:901a:be6c:b581]) by
	BN8PR12MB3587.namprd12.prod.outlook.com
	([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.027;
	Mon, 28 Feb 2022 20:56:55 +0000
Message-ID: <0b65541a-3da7-dc35-690a-0ada75b0adae@amd.com>
Date: Mon, 28 Feb 2022 21:56:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.5.0
Content-Language: en-US
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
	<20220228110822.491923-3-jakobkoschel@gmail.com>
	<2e4e95d6-f6c9-a188-e1cd-b1eae465562a@amd.com>
	<CAHk-=wgQps58DPEOe4y5cTh5oE9EdNTWRLXzgMiETc+mFX7jzw@mail.gmail.com>
	<282f0f8d-f491-26fc-6ae0-604b367a5a1a@amd.com>
	<b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <b2d20961dbb7533f380827a7fcc313ff849875c1.camel@HansenPartnership.com>
X-ClientProxiedBy: AS9PR06CA0391.eurprd06.prod.outlook.com
	(2603:10a6:20b:461::13) To BN8PR12MB3587.namprd12.prod.outlook.com
	(2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5d93b6b-0ff9-44b8-c708-08d9fafcd9d6
X-MS-TrafficTypeDiagnostic: MWHPR12MB1358:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB135876DCC70C7010449070CC83019@MWHPR12MB1358.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCJwxYpH+lWcUKDM9hJhLOnNxhU8mMUL5h1/vKXYQ6mznrTp3VbXaYx8UvNzaSs6zg1AgIGaK7T3OxQja1IzwyGoagVY5toRT3tZcD6WLq383ZPLCT6arVWZmI5mJZfqc7mTfPcziJr1zGR+I+RGN0RCGU9cfxEDuDJgysZZXu4gaSt83it03POPNW7bBdx7QxCytpibh6tgwcuTn7uiy7ccKkFfoYgkCAS53qttj858vnCjTkbYOXWURVmJZMKC6HIZdI7yjjwHsHHP3SZgxKKwmYMZeZytGOvQNf30Vtg0NA078jW/+48fsy42N+AvvA1kFGUGOmNHGEj2e9Iu7Qgicf8hm0anNY7IZg0SgDc8DU6Axp6WE7fjOV+wzvkZhCpA83S+e5buUttZg40RJWQ9026lftLFsM5BLvH/9LN7mnrlRwfFFCwIHurI06uMJ6x3xNSkxjytbJbt2rrDubt0KMTRZSQZLJgRPIJ6guN3SMXTxHX3tOYzTkOJBvXRv6RK88OShcqmtm0eBPoOtgGq5rfVdgSiaXc/WQPZ8U3VreUsJf3y1xoS+Jh65CI009hxza0rPuuSP9EeYksLPGZdkK7shjZG90Yn1NLvwpP7dTXVxUWJ3tROOLPZAqmkWpvMqKf7WjQb8RLtclGiOQMaPRIC+hEqRtOHFqxZEcyf7+2vzQ4GcYmkxApvapN3vtoUVkc3thbFl8j0fqQa2vaBcFJI1GQVp4LwfiAEeDA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(8936002)(8676002)(6506007)(53546011)(31686004)(508600001)(5660300002)(6512007)(6666004)(86362001)(2616005)(186003)(38100700002)(31696002)(7366002)(7406005)(7416002)(6486002)(66946007)(66556008)(66476007)(2906002)(110136005)(4326008)(54906003)(36756003)(316002)(43740500002)(45980500001);
	DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU5SekVSYkpVTFBzbVdSU00zSlZ0V3pOQjBOUm9JUUo0dktMYmEwbkZmOE41?=
	=?utf-8?B?S0NwSC9KQXlkQ2NCUStLQitXWVZTeFYxVDVIK3hQTkVXeXBFSU01MnB3VmFt?=
	=?utf-8?B?QXBRLzNEcndKeFdKVDQwTzE2SG9ObXNFY3lSNTN0azI1U3YwYi9pTXJwbUJV?=
	=?utf-8?B?MDlqMUI2NXphR2c1cnlkVC9hT2NWcmtFQWsvNjU2TmdHTkd0dGxsZitFeTdm?=
	=?utf-8?B?bmRGSUl4KzluM0xzQUlkMC95dzVqUDlLMHpFKzhuZkJBVHpZMWM3SkxWYVRx?=
	=?utf-8?B?V2ZoUzQybjJReVpWT0tEUVppWEJISDR1K0pzcGgwYmxkOU1JdlQrRGFudkdQ?=
	=?utf-8?B?R28yZEM4MWdHdC9LZ2c3cEZVODBwRG9ENzVpWmFXZGtucFJITndMTnBHTi9U?=
	=?utf-8?B?b2NkSElVWDY0c1pneGh2dCt2SFFlZ0hnS0dwR1hudThTdEcyTitiY2JJelgx?=
	=?utf-8?B?M0ZPaHpSaVdLdnViQ21wRno1YVJ0ZEI4V1loVHpOTG95NlI1ditpT0U4dTFE?=
	=?utf-8?B?QTlWVWVDTHJOeVN3QXVlM1d3ZVc2TVpBcndOU0JKV0RYTTJVbWQ1KzN2ZXZy?=
	=?utf-8?B?YjAxcXdnNFBiaWo4L0YzK0JYZ1grWWZISjUrSmdyY2NkdnUvVW45M1dna1Fl?=
	=?utf-8?B?aklMMkxTbnFwNkZrYUkrRUZFVWo0d0dNemxsZWxpT1ljcjRuOXJLbzFDOFRp?=
	=?utf-8?B?M1hQdzRyVll0TUNtVllyT2hERlRxMTlRNXdjY1F3RXkvNmFwZHZCQUtTdUpi?=
	=?utf-8?B?b1Rqb2VaMjYrc1R5OUVmeWN3ZWN4THMyUGdFemFKT044MTc0Z2pKTUtkaHR6?=
	=?utf-8?B?L0o4TDZRLzd6RndWTlVVVWlDckpacUlCOUU4ek4vVkpBVmpTbDRYVmtERzhH?=
	=?utf-8?B?c0UzOW5oVU5yTnNMNkpkQWhkdWNFWTVRUzhmMVRSOWh4amhqSDRsZGRkdGZ1?=
	=?utf-8?B?ZWdVWUtRUzNRTGhMV3UyaWJZQVQxeG1yWmJ6UzJ1Vk5iUzZQVDVZeGszd1NH?=
	=?utf-8?B?S3lLS3Azc0M0NFpzTWhnSkc5T3l4UWtOZ3FQSzhpRmp2OUJpRzBidkN3RE1o?=
	=?utf-8?B?Y0FTR21XZE1ZYmxYV2J4ZXR1enhHTzlldCsrYlRCanIxVXJQL2V0cktCTlhQ?=
	=?utf-8?B?WVFwQW1QSFV6bjQ1Qy9IaHpGVGdxaVpaV05sRG04TWFFcFp0cjNQdzdIYkpT?=
	=?utf-8?B?cGZRclg5QnFCVFl6WkpRK0FlRU0zTDdsVHBaU29DTERiZTI5UXZ4MFFOd21n?=
	=?utf-8?B?NnQ5Y1grZ1M4eWZGUHZNSEpDN2syaGRaclA0TjVjdHd0SjljREhnZ25tL00r?=
	=?utf-8?B?VStmWHpNVTVQcC9PeUEzWnhrMTNicEtJWE1YWU5kTXZyWis1ZmZ0NjB1bWNm?=
	=?utf-8?B?S0tpdlVhZ0dNd2tLUlBscllWLzNuUXBrOFpXQzBNbUIvcHBRU3NZeVd1cmpU?=
	=?utf-8?B?bU5VeXZJRldzZWZRSGZqbnVCUHpESVUrVVpGTlIwTEs4aTN4SmVNUldPODd1?=
	=?utf-8?B?QXpxcUREVGlndlRTSTdEVG9kYWpPdzUrcXZKVUtZNGFDYThteGZEbjU1eUNS?=
	=?utf-8?B?TVRLa2YwR3ltRWp1NDEyTnFSdE93N0U0cFZLa08zKzBMMEtsNlJlc2M5SStn?=
	=?utf-8?B?enVtRm9PMytPUlBSbTRDWmlTelcrdUdJaHJ5cHp1QVRLbXVRdXI0OXh3YWYy?=
	=?utf-8?B?YnFhT2VtYmJubGdMTUhRWjM3Qjh2OXU0b1dJSnE1U1RadzlKYVRPY3pYTHVx?=
	=?utf-8?B?MVR1YkdhcFRqZW1wV2tYZVA1dTFORGJjK1hNbVdPcWQxMkg0a3gvbXRVRVBq?=
	=?utf-8?B?cHI4UzM3SUVLYkplamliZHF5OE1XQ1QweGdpL3Vlbk9rMXN0ODFZU2VhQnla?=
	=?utf-8?B?NGoxYWFzREN1MlBqUm1mL2dhOWx5dG9iWjJVanhOZmE5ay9kWjd6MHJ1bUY1?=
	=?utf-8?B?dTRPR3pmNFJPek95eWtKVHNkeVBpcXJ1QmFVNXhCMUJRSlZEenZYTFdFUWtt?=
	=?utf-8?B?K0IrOXQ1Q2xxRGVCdmVjbnF5RUQ1a2s3RllaeURHbkxmV29POWlQVTE3TVdG?=
	=?utf-8?B?amFUZ2lVeVRFa2pQTGxkNlRnZ1o5bnRZMUkrRnI0SWhzQ3RmTlBLVFhIbTR0?=
	=?utf-8?B?QWl5c05PQVNkY1dBekFVT2tkQmlOZGN2a1A3Z2RLbFhneUMzZ0JFU1g3RGpP?=
	=?utf-8?Q?FKBOE8OU6FXI2GAhR0nL9P8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d93b6b-0ff9-44b8-c708-08d9fafcd9d6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 20:56:55.1037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5fDrSjDhnjb50HK28WFgHk7t+a6+YLAgFGwipLcfbexSbeXvJRtJ5PwN/fXYnfj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1358
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

CgpBbSAyOC4wMi4yMiB1bSAyMTo0MiBzY2hyaWViIEphbWVzIEJvdHRvbWxleToKPiBPbiBNb24s
IDIwMjItMDItMjggYXQgMjE6MDcgKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFt
IDI4LjAyLjIyIHVtIDIwOjU2IHNjaHJpZWIgTGludXMgVG9ydmFsZHM6Cj4+PiBPbiBNb24sIEZl
YiAyOCwgMjAyMiBhdCA0OjE5IEFNIENocmlzdGlhbiBLw7ZuaWcKPj4+IDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+IHdyb3RlOgo+Pj4gW1NOSVBdCj4+PiBBbnlib2R5IGhhdmUgYW55IGlkZWFz
Pwo+PiBJIHRoaW5rIHdlIHNob3VsZCBsb29rIGF0IHRoZSB1c2UgY2FzZXMgd2h5IGNvZGUgaXMg
dG91Y2hpbmcgKHBvcykKPj4gYWZ0ZXIgdGhlIGxvb3AuCj4+Cj4+IEp1c3QgZnJvbSBza2ltbWlu
ZyBvdmVyIHRoZSBwYXRjaGVzIHRvIGNoYW5nZSB0aGlzIGFuZCBleHBlcmllbmNlCj4+IHdpdGgg
dGhlIGRyaXZlcnMvc3Vic3lzdGVtcyBJIGhlbHAgdG8gbWFpbnRhaW4gSSB0aGluayB0aGUgcHJp
bWFyeQo+PiBwYXR0ZXJuIGxvb2tzIHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Cj4+IGxpc3RfZm9y
X2VhY2hfZW50cnkoZW50cnksIGhlYWQsIG1lbWJlcikgewo+PiAgICAgICBpZiAoc29tZV9jb25k
aXRpb25fY2hlY2tpbmcoZW50cnkpKQo+PiAgICAgICAgICAgYnJlYWs7Cj4+IH0KPj4gZG9fc29t
ZXRoaW5nX3dpdGgoZW50cnkpOwo+Cj4gQWN0dWFsbHksIHdlIHVzdWFsbHkgaGF2ZSBhIGNoZWNr
IHRvIHNlZSBpZiB0aGUgbG9vcCBmb3VuZCBhbnl0aGluZywKPiBidXQgaW4gdGhhdCBjYXNlIGl0
IHNob3VsZCBzb21ldGhpbmcgbGlrZQo+Cj4gaWYgKGxpc3RfZW50cnlfaXNfaGVhZChlbnRyeSwg
aGVhZCwgbWVtYmVyKSkgewo+ICAgICAgcmV0dXJuIHdpdGggZXJyb3I7Cj4gfQo+IGRvX3NvbWV0
aGluX3dpdGgoZW50cnkpOwo+Cj4gU3VmZmljZT8gIFRoZSBsaXN0X2VudHJ5X2lzX2hlYWQoKSBt
YWNybyBpcyBkZXNpZ25lZCB0byBjb3BlIHdpdGggdGhlCj4gYm9ndXMgZW50cnkgb24gaGVhZCBw
cm9ibGVtLgoKVGhhdCB3aWxsIHdvcmsgYW5kIGlzIGFsc28gd2hhdCBwZW9wbGUgYWxyZWFkeSBk
by4KClRoZSBrZXkgcHJvYmxlbSBpcyB0aGF0IHdlIGxldCBwZW9wbGUgZG8gdGhlIHNhbWUgdGhp
bmcgb3ZlciBhbmQgb3ZlciAKYWdhaW4gd2l0aCBzbGlnaHRseSBkaWZmZXJlbnQgaW1wbGVtZW50
YXRpb25zLgoKT3V0IGluIHRoZSB3aWxkIEkndmUgc2VlbiBhdCBsZWFzdCB1c2luZyBhIHNlcGFy
YXRlIHZhcmlhYmxlLCB1c2luZyBhIApib29sIHRvIGluZGljYXRlIHRoYXQgc29tZXRoaW5nIHdh
cyBmb3VuZCBhbmQganVzdCBhc3N1bWluZyB0aGF0IHRoZSAKbGlzdCBoYXMgYW4gZW50cnkuCgpU
aGUgbGFzdCBjYXNlIGlzIGJvZ3VzIGFuZCBiYXNpY2FsbHkgd2hhdCBjYW4gYnJlYWsgYmFkbHku
CgpJZiB3ZSB3b3VsZCBoYXZlIGFuIHVuaWZpZWQgbWFjcm8gd2hpY2ggc2VhcmNoIGZvciBhbiBl
bnRyeSBjb21iaW5lZCAKd2l0aCBhdXRvbWF0ZWQgcmVwb3J0aW5nIG9uIHBhdGNoZXMgdG8gdXNl
IHRoYXQgbWFjcm8gSSB0aGluayB0aGUgCnBvdGVudGlhbCB0byBpbnRyb2R1Y2Ugc3VjaCBpc3N1
ZXMgd2lsbCBhbHJlYWR5IGdvIGRvd24gbWFzc2l2ZWx5IAp3aXRob3V0IGF1ZGl0aW5nIHRvbnMg
b2YgZXhpc3RpbmcgY29kZS4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBKYW1lcwo+Cj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1h
aWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
