Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 907387A2817
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Sep 2023 22:31:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0AA86425C97;
	Fri, 15 Sep 2023 22:31:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 429 seconds by postgrey-1.31 at mail19;
	Fri, 15 Sep 2023 22:30:59 CEST
Received: from omta36.uswest2.a.cloudfilter.net
	(omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D82AD4203B2
	for <drbd-dev@lists.linbit.com>; Fri, 15 Sep 2023 22:30:59 +0200 (CEST)
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTP
	id hCX9qLRyvEoVshFLwqHo3L; Fri, 15 Sep 2023 20:23:48 +0000
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with ESMTPS
	id hFLwqZHU3nxNghFLwq35YK; Fri, 15 Sep 2023 20:23:48 +0000
X-Authority-Analysis: v=2.4 cv=PrSA0iA3 c=1 sm=1 tr=0 ts=6504bd54
	a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
	a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
	a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8
	a=MRXkqwc6AAAA:8 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8
	a=Mw5oN-FQwNtlLNIY7psA:9
	a=QEXdDO2ut3YA:10 a=tmQuKXRa9JHWtioalwAU:22 a=AjGcO6oz07-iQ99wixmX:22
	a=xmb-EsYY8bH0VWELuYED:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dRKiLGohBO+l2o2LcNabfrL4Za7Tt/SCkLsJLXnqc/s=;
	b=XoYtOhMDah9gcug71RnUEpxyGR
	37eNPy3kq5IFwpQbDJz4MgcSY//yxuoGzx2mxtZ4Y7md7RgTSmdpidy25q2CVTDo0V31M3C+ep5+l
	sIgRWv83wwXabhWaDa1i+uwqPOEbBKyd63eqVnplD+wVRHcIKC76rF0Q/iHjODGpWPubcRPvXLACu
	MeisaMFzEI2aNaNDeA5hz7LdTkPayrNw02CyXNHkCDCkZhJGCXw5HdgTv0GenubQ2ZkiCDAIDmtkb
	Xm5CwnNuJdtN00tFCmrfHbVS6SqYFSEcZbVP+UUKzv4EPDA0t7s1gXsGmvjGXg1udhvWnW9dzIsp3
	m02ryiPA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:34976
	helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
	(envelope-from <gustavo@embeddedor.com>) id 1qhFLu-002GXj-10;
	Fri, 15 Sep 2023 15:23:47 -0500
Message-ID: <c2c552ff-c650-1e69-b552-f6f872605526@embeddedor.com>
Date: Fri, 15 Sep 2023 14:24:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.13.0
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
	Philipp Reisner <philipp.reisner@linbit.com>
References: <20230915200316.never.707-kees@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20230915200316.never.707-kees@kernel.org>
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linbit.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1qhFLu-002GXj-10
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.8])
	[187.162.21.192]:34976
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 60
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJPyn4NFmIn0TrzBlTojtNSYwmWQgPwFIT5DO8E+wXWyht3IcdL22wGTMnhYH0YJmaj7oYLdzW9Tzgvt6MMg4l1bJACKe5oncpDxUwwlJuKh4Y+z31Tr
	/i5bnTZsBPbHOsRNlXzjz1iKHt8xSrz/rW3QcH9hdVEgFECeH9E+ebZ7iMszWgaGmGXVKQYJzT5PFUDdpRG1Yq5Lz09rT7lYf4U=
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Annotate struct fifo_buffer with
	__counted_by
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

CgpPbiA5LzE1LzIzIDE0OjAzLCBLZWVzIENvb2sgd3JvdGU6Cj4gUHJlcGFyZSBmb3IgdGhlIGNv
bWluZyBpbXBsZW1lbnRhdGlvbiBieSBHQ0MgYW5kIENsYW5nIG9mIHRoZSBfX2NvdW50ZWRfYnkK
PiBhdHRyaWJ1dGUuIEZsZXhpYmxlIGFycmF5IG1lbWJlcnMgYW5ub3RhdGVkIHdpdGggX19jb3Vu
dGVkX2J5IGNhbiBoYXZlCj4gdGhlaXIgYWNjZXNzZXMgYm91bmRzLWNoZWNrZWQgYXQgcnVuLXRp
bWUgY2hlY2tpbmcgdmlhIENPTkZJR19VQlNBTl9CT1VORFMKPiAoZm9yIGFycmF5IGluZGV4aW5n
KSBhbmQgQ09ORklHX0ZPUlRJRllfU09VUkNFIChmb3Igc3RyY3B5L21lbWNweS1mYW1pbHkKPiBm
dW5jdGlvbnMpLgo+IAo+IEFzIGZvdW5kIHdpdGggQ29jY2luZWxsZVsxXSwgYWRkIF9fY291bnRl
ZF9ieSBmb3Igc3RydWN0IGZpZm9fYnVmZmVyLgo+IAo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20v
a2Vlcy9rZXJuZWwtdG9vbHMvYmxvYi90cnVuay9jb2NjaW5lbGxlL2V4YW1wbGVzL2NvdW50ZWRf
YnkuY29jY2kKPiAKPiBDYzogUGhpbGlwcCBSZWlzbmVyIDxwaGlsaXBwLnJlaXNuZXJAbGluYml0
LmNvbT4KPiBDYzogTGFycyBFbGxlbmJlcmcgPGxhcnMuZWxsZW5iZXJnQGxpbmJpdC5jb20+Cj4g
Q2M6ICJDaHJpc3RvcGggQsO2aG13YWxkZXIiIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0
LmNvbT4KPiBDYzogSmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgo+IENjOiBkcmJkLWRldkBs
aXN0cy5saW5iaXQuY29tCj4gQ2M6IGxpbnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZwo+IFNpZ25l
ZC1vZmYtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3JnPgoKUmV2aWV3ZWQtYnk6
IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KClRoYW5rcwotLSAK
R3VzdGF2bwoKPiAtLS0KPiAgIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oIHwgMiArLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oIGIvZHJpdmVycy9ibG9jay9k
cmJkL2RyYmRfaW50LmgKPiBpbmRleCBhMzBhNWVkODExYmUuLjdlZWNjNTNmYWUzZCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaAo+ICsrKyBiL2RyaXZlcnMvYmxv
Y2svZHJiZC9kcmJkX2ludC5oCj4gQEAgLTU1Myw3ICs1NTMsNyBAQCBzdHJ1Y3QgZmlmb19idWZm
ZXIgewo+ICAgCXVuc2lnbmVkIGludCBoZWFkX2luZGV4Owo+ICAgCXVuc2lnbmVkIGludCBzaXpl
Owo+ICAgCWludCB0b3RhbDsgLyogc3VtIG9mIGFsbCB2YWx1ZXMgKi8KPiAtCWludCB2YWx1ZXNb
XTsKPiArCWludCB2YWx1ZXNbXSBfX2NvdW50ZWRfYnkoc2l6ZSk7Cj4gICB9Owo+ICAgZXh0ZXJu
IHN0cnVjdCBmaWZvX2J1ZmZlciAqZmlmb19hbGxvYyh1bnNpZ25lZCBpbnQgZmlmb19zaXplKTsK
PiAgIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJk
LWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3Rz
LmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
