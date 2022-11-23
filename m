Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E96F635978
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Nov 2022 11:16:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3DD14252F9;
	Wed, 23 Nov 2022 11:16:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 193114252F3
	for <drbd-dev@lists.linbit.com>; Wed, 23 Nov 2022 11:16:38 +0100 (CET)
Received: by mail-wr1-f42.google.com with SMTP id x5so24587667wrt.7
	for <drbd-dev@lists.linbit.com>; Wed, 23 Nov 2022 02:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=SfSgzRdu52VXS9GHSMI5+bTUMj6/o+2tOE+xfBwsoLI=;
	b=vyoQ2dpNfzsrZ300v6wxqZnvPhVhRdPuHPQvGEbWYsQBoyRG8NPbYI76SriVBh+AYr
	cuQIkXiAUv0xfWdO4pVTfOWajTLifDHXY6AKmbmxMskHxz379ACEDgCMLHup7dHenRD2
	AWcHhy+LWODVy39Hlm++2R7aAGfQhCxH1NxPaBsOWhydPQCy67i2ZpPd5SQ/J1A2DiR3
	0slOLKfp5fB5utKW+bWmwrbaAQFOx2Nx8tf5UKyg43XexztDReg+cw+9EuS5I4mOcPMw
	nM1pxaKD3GCXEghPDWRdOqPL0+ehtTHpGFi1bfRVXB3fIk0r9Y4ZXhBtW/h3MAnMw5/u
	BsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=SfSgzRdu52VXS9GHSMI5+bTUMj6/o+2tOE+xfBwsoLI=;
	b=55OJEriygjFGSEcPqmuEBhlakd/AJ0kehoUQd7iYbIbwNUfQVmNc66hF7dLdBttqKE
	3Gw5HARZkfXU5pUZJ0u8Su9ri4+y9qgPuiRIA7K02uQ41EzEkpyq5g7Chb41AkTgtTtf
	6UBtt5uMdeNNbCcpoPXy1vMnCncTgusNqizRJ6NiKuW8GqTt/bxenLqRwOiSwLzQW50J
	3zCGqtUuVtTaiKPMJhhpJkZE57AqvUOdFh3ehwLJY8a3J6Mlkmx5Bj3MISFmx3wtghAj
	H6gk2s2FNl+7/pgSjbZWVGFBPNEscRsiKOjcHIui//4UOtGKIaUHeqnbwvk0wEsXGGCq
	Sa1w==
X-Gm-Message-State: ANoB5pmQAgZk80zCY2jt9Z+jAH2dQ2wYWdofu9DuPSqqMQWZEOVSwXDQ
	29D2GE/23JGsmNLUj8Nc5Xw6RqhY
X-Google-Smtp-Source: AA0mqf6t1LjgypMVT8M/b/3MjMH25M3QL5zBf6bgM6451Mnv+JB0P9H15buIoAK2B/PKaNx72KFLCQ==
X-Received: by 2002:adf:e2ca:0:b0:22e:4ac2:aaa5 with SMTP id
	d10-20020adfe2ca000000b0022e4ac2aaa5mr16663662wrj.455.1669198598492;
	Wed, 23 Nov 2022 02:16:38 -0800 (PST)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	g16-20020adffc90000000b0022ae401e9e0sm16304581wrr.78.2022.11.23.02.16.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 23 Nov 2022 02:16:38 -0800 (PST)
Message-ID: <e396a423-97e7-2b50-21e3-7ac4070b6d9a@linbit.com>
Date: Wed, 23 Nov 2022 11:16:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.4.1
Content-Language: en-US
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
References: <20221123020355.2470160-1-bobo.shaobowang@huawei.com>
	<20221123020355.2470160-3-bobo.shaobowang@huawei.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20221123020355.2470160-3-bobo.shaobowang@huawei.com>
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, lars.ellenberg@linbit.com,
	liwei391@huawei.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v3 2/2] drbd: destroy workqueue when drbd
	device was freed
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

QW0gMjMuMTEuMjIgdW0gMDM6MDMgc2NocmllYiBXYW5nIFNoYW9CbzoKPiBBIHN1Ym1pdHRlciB3
b3JrcXVldWUgaXMgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGJ5IGluaXRfc3VibWl0dGVyKCkKPiBj
YWxsZWQgYnkgZHJiZF9jcmVhdGVfZGV2aWNlKCksIHdlIHNob3VsZCBkZXN0cm95IGl0IHdoZW4g
dGhpcwo+IGRldmljZSBpcyBub3QgbmVlZGVkIG9yIGRlc3Ryb3llZC4KPiAKPiBGaXhlczogMTEz
ZmVmOWUyMGUwICgiZHJiZDogcHJlcGFyZSB0byBxdWV1ZSB3cml0ZSByZXF1ZXN0cyBvbiBhIHN1
Ym1pdCB3b3JrZXIiKQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgU2hhb0JvIDxib2JvLnNoYW9ib3dh
bmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAKPiB2MzoKPiAgIC0gYWRkIG91dF8qIGxhYmVsIGZvciBk
ZXN0cm95X3dvcmtxdWV1ZSgpLgo+IAo+ICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMg
fCA2ICsrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+IGluZGV4IDc4Y2FlNGU3NWFmMS4uNjc3MjQw
MjMyNjg0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+ICsr
KyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYwo+IEBAIC0yMjE3LDYgKzIyMTcsOCBA
QCB2b2lkIGRyYmRfZGVzdHJveV9kZXZpY2Uoc3RydWN0IGtyZWYgKmtyZWYpCj4gIAkJa3JlZl9w
dXQoJnBlZXJfZGV2aWNlLT5jb25uZWN0aW9uLT5rcmVmLCBkcmJkX2Rlc3Ryb3lfY29ubmVjdGlv
bik7Cj4gIAkJa2ZyZWUocGVlcl9kZXZpY2UpOwo+ICAJfQo+ICsJaWYgKGRldmljZS0+c3VibWl0
LndxKQo+ICsJCWRlc3Ryb3lfd29ya3F1ZXVlKGRldmljZS0+c3VibWl0LndxKTsKPiAgCWtmcmVl
KGRldmljZSk7Cj4gIAlrcmVmX3B1dCgmcmVzb3VyY2UtPmtyZWYsIGRyYmRfZGVzdHJveV9yZXNv
dXJjZSk7Cj4gIH0KPiBAQCAtMjc3MSw3ICsyNzczLDcgQEAgZW51bSBkcmJkX3JldF9jb2RlIGRy
YmRfY3JlYXRlX2RldmljZShzdHJ1Y3QgZHJiZF9jb25maWdfY29udGV4dCAqYWRtX2N0eCwgdW5z
aWcKPiAgCj4gIAllcnIgPSBhZGRfZGlzayhkaXNrKTsKPiAgCWlmIChlcnIpCj4gLQkJZ290byBv
dXRfaWRyX3JlbW92ZV9mcm9tX3Jlc291cmNlOwo+ICsJCWdvdG8gb3V0X2Rlc3Ryb3lfd29ya3F1
ZXVlOwo+ICAKPiAgCS8qIGluaGVyaXQgdGhlIGNvbm5lY3Rpb24gc3RhdGUgKi8KPiAgCWRldmlj
ZS0+c3RhdGUuY29ubiA9IGZpcnN0X2Nvbm5lY3Rpb24ocmVzb3VyY2UpLT5jc3RhdGU7Cj4gQEAg
LTI3ODUsNiArMjc4Nyw4IEBAIGVudW0gZHJiZF9yZXRfY29kZSBkcmJkX2NyZWF0ZV9kZXZpY2Uo
c3RydWN0IGRyYmRfY29uZmlnX2NvbnRleHQgKmFkbV9jdHgsIHVuc2lnCj4gIAlkcmJkX2RlYnVn
ZnNfZGV2aWNlX2FkZChkZXZpY2UpOwo+ICAJcmV0dXJuIE5PX0VSUk9SOwo+ICAKPiArb3V0X2Rl
c3Ryb3lfd29ya3F1ZXVlOgo+ICsJZGVzdHJveV93b3JrcXVldWUoZGV2aWNlLT5zdWJtaXQud3Ep
Owo+ICBvdXRfaWRyX3JlbW92ZV9mcm9tX3Jlc291cmNlOgo+ICAJZm9yX2VhY2hfY29ubmVjdGlv
bl9zYWZlKGNvbm5lY3Rpb24sIG4sIHJlc291cmNlKSB7Cj4gIAkJcGVlcl9kZXZpY2UgPSBpZHJf
cmVtb3ZlKCZjb25uZWN0aW9uLT5wZWVyX2RldmljZXMsIHZucik7CgpUaGFua3MhCgpSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0
LmNvbT4KCi0tIApDaHJpc3RvcGggQsO2aG13YWxkZXIKTElOQklUIHwgS2VlcGluZyB0aGUgRGln
aXRhbCBXb3JsZCBSdW5uaW5nCkRSQkQgSEEg4oCUICBEaXNhc3RlciBSZWNvdmVyeSDigJQgU29m
dHdhcmUgZGVmaW5lZCBTdG9yYWdlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQu
Y29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
