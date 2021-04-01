Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9C3514F8
	for <lists+drbd-dev@lfdr.de>; Thu,  1 Apr 2021 15:01:25 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5EF99420640;
	Thu,  1 Apr 2021 15:01:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2182420622
	for <drbd-dev@lists.linbit.com>; Thu,  1 Apr 2021 15:01:22 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id a7so2766134ejs.3
	for <drbd-dev@lists.linbit.com>; Thu, 01 Apr 2021 06:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DKucwrvqnS4ht56NCdJBx9ixTsgm/R5Veio9TkNchd4=;
	b=vU5K+nMRwdzl1ovjDPA/LcNRYNCAK+kL3SOr5YE4ZFIgc2bgUQofJFw3K1pi8nCj/F
	5usKW5GoZ19gPKAuTc49VuOwyGi9u6ao6UbCdpVYGc8F47h7ELB+tD3TQoQkuA3O47kL
	x5OYsOLIzkX4tHnmQeQ3RgiVrNCzpxsF8l0Ic1GwaYD8SKOL1TKHFvfv1j+ECET85lun
	jxTE3qQy0/4whF7B8RWXot/WDWrAVWXsMSJ44NrXCRFULgLQr/d4rgfoQDYEtvVrLIqg
	wTF6OpHP7wxFFCort23WIr1aqPZn2bnlUQItRt4/H/fy3oA0cC4dnETDFnatvlS6u7rS
	rEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DKucwrvqnS4ht56NCdJBx9ixTsgm/R5Veio9TkNchd4=;
	b=oSGIeEj8Ok8jVudE3WRy2OiYI8uIaeJV8rbJ5ZOfDi4AWT9LD+xT4gnYyzgss/ZC/s
	6PY/GH8sKmeC61Z/qHm+SKup8m3sM8hFO+FZQMlxR5WTUZRHxZIBB5JGE2XhYWVOd+4v
	CHC3yIhrxYrCtcpggbDzuSMA78f2EfljGw37PE87Mc4UAJqkrBGI+vdZ9Bn/o0Gb57fF
	tsV8KV2bvJNNhuplJzSrL8MV2ZtmcDF6iuiRX2SV9Plzl2VfIWFeSMpalvZ+qCZrL9W/
	yka/R/O1LaREWazt2Q4YPHPF6Oi8N7JvZHwXje5XLNTSE/kQh7QMQUoJAgEsjEbyvg+M
	7cLg==
X-Gm-Message-State: AOAM530Pn7UPIx7dZW4ysHzBlMszQFCGIdx4iV/I+I9TEidhwslKD4aw
	eY5fRDJx4NLBBA8bK1zCw/RYVLx3/aALJIcx4ceZ+w==
X-Google-Smtp-Source: ABdhPJw0Q0FmAEQV3rWyMyG72YjzxQat9aGGgn5eiai9dSLSwA7qAsnC7lnjcZuTYBRQB3d8XNHq0Q==
X-Received: by 2002:a17:907:7683:: with SMTP id
	jv3mr8912633ejc.450.1617282082032; 
	Thu, 01 Apr 2021 06:01:22 -0700 (PDT)
Received: from linux.fritz.box (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	k12sm3467494edo.50.2021.04.01.06.01.21
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 01 Apr 2021 06:01:21 -0700 (PDT)
To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
References: <20210401115753.3684-1-lyl2019@mail.ustc.edu.cn>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <cb0f43e4-bfde-ac77-5153-f2f3cbed0172@linbit.com>
Date: Thu, 1 Apr 2021 15:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210401115753.3684-1-lyl2019@mail.ustc.edu.cn>
Content-Language: en-US
Cc: axboe@kernel.dk, philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Fix a use after free in
 get_initial_state
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

T24gNC8xLzIxIDE6NTcgUE0sIEx2IFl1bmxvbmcgd3JvdGU6Cj4gSW4gZ2V0X2luaXRpYWxfc3Rh
dGUsIGl0IGNhbGxzIG5vdGlmeV9pbml0aWFsX3N0YXRlX2RvbmUoc2tiLC4uKSBpZgo+IGNiLT5h
cmdzWzVdPT0xLiBJIHNlZSB0aGF0IGlmIGdlbmxtc2dfcHV0KCkgZmFpbGVkIGluCj4gbm90aWZ5
X2luaXRpYWxfc3RhdGVfZG9uZSgpLCB0aGUgc2tiIHdpbGwgYmUgZnJlZWQgYnkgbmxtc2dfZnJl
ZShza2IpLgo+IFRoZW4gZ2V0X2luaXRpYWxfc3RhdGUgd2lsbCBnb3RvIG91dCBhbmQgdGhlIGZy
ZWVkIHNrYiB3aWxsIGJlIHVzZWQgYnkKPiByZXR1cm4gdmFsdWUgc2tiLT5sZW4uCj4gCj4gTXkg
cGF0Y2ggbGV0cyBza2JfbGVuID0gc2tiLT5sZW4gYW5kIHJldHVybiB0aGUgc2tiX2xlbiB0byBh
dm9pZCB0aGUgdWFmLgo+IAo+IEZpeGVzOiBhMjk3Mjg0NjNiMjU0ICgiZHJiZDogQmFja3BvcnQg
dGhlICJldmVudHMyIiBjb21tYW5kIikKPiBTaWduZWQtb2ZmLWJ5OiBMdiBZdW5sb25nIDxseWwy
MDE5QG1haWwudXN0Yy5lZHUuY24+Cj4gLS0tCj4gICBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9u
bC5jIHwgMyArKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYyBiL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKPiBpbmRleCBiZjdkZTRjN2I5NmMuLjQ3NGY4NDY3
NWQwYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jCj4gKysrIGIv
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYwo+IEBAIC00OTA1LDYgKzQ5MDUsNyBAQCBzdGF0
aWMgaW50IGdldF9pbml0aWFsX3N0YXRlKHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRs
aW5rX2NhbGxiYWNrICpjYikKPiAgIAlzdHJ1Y3QgZHJiZF9zdGF0ZV9jaGFuZ2UgKnN0YXRlX2No
YW5nZSA9IChzdHJ1Y3QgZHJiZF9zdGF0ZV9jaGFuZ2UgKiljYi0+YXJnc1swXTsKPiAgIAl1bnNp
Z25lZCBpbnQgc2VxID0gY2ItPmFyZ3NbMl07Cj4gICAJdW5zaWduZWQgaW50IG47Cj4gKwl1bnNp
Z25lZCBpbnQgc2tiX2xlbiA9IHNrYi0+bGVuOwo+ICAgCWVudW0gZHJiZF9ub3RpZmljYXRpb25f
dHlwZSBmbGFncyA9IDA7Cj4gICAKPiAgIAkvKiBUaGVyZSBpcyBubyBuZWVkIGZvciB0YWtpbmcg
bm90aWZpY2F0aW9uX211dGV4IGhlcmU6IGl0IGRvZXNuJ3QKPiBAQCAtNDkxNSw3ICs0OTE2LDcg
QEAgc3RhdGljIGludCBnZXRfaW5pdGlhbF9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1
Y3QgbmV0bGlua19jYWxsYmFjayAqY2IpCj4gICAJY2ItPmFyZ3NbNV0tLTsKPiAgIAlpZiAoY2It
PmFyZ3NbNV0gPT0gMSkgewo+ICAgCQlub3RpZnlfaW5pdGlhbF9zdGF0ZV9kb25lKHNrYiwgc2Vx
KTsKPiAtCQlnb3RvIG91dDsKPiArCQlyZXR1cm4gc2tiX2xlbjsKPiAgIAl9Cj4gICAJbiA9IGNi
LT5hcmdzWzRdKys7Cj4gICAJaWYgKGNiLT5hcmdzWzRdIDwgY2ItPmFyZ3NbM10pCj4gCgpUaGFu
a3MgZm9yIHRoZSBwYXRjaCEKCkkgdGhpbmsgdGhlIHByb2JsZW0gZ29lcyBldmVuIGZ1cnRoZXI6
IHNrYiBjYW4gYWxzbyBiZSBmcmVlZCBpbiB0aGUgCm5vdGlmeV8qX3N0YXRlX2NoYW5nZSAtPiBu
b3RpZnlfKl9zdGF0ZSBjYWxscyBiZWxvdy4KCkFsc28sIGF0IHRoZSBwb2ludCB3aGVyZSB3ZSBz
YXZlIHNrYi0+bGVuIGludG8gc2tiX2xlbiwgc2tiIGlzIG5vdCAKaW5pdGlhbGl6ZWQgeWV0LiBN
YXliZSBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIG5vdCByZXR1cm4gYSBsZW5ndGggaW4gdGhlIApm
aXJzdCBwbGFjZSBoZXJlLCBidXQgYW4gZXJyb3IgY29kZSBpbnN0ZWFkLgoKLS0gCkNocmlzdG9w
aCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1bm5pbmcK
RFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVkIFN0b3Jh
Z2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1k
ZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5s
aW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
