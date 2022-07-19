Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C520C57988A
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jul 2022 13:31:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A5E20420668;
	Tue, 19 Jul 2022 13:31:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 714D54201A7
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jul 2022 13:31:32 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id b11so26569110eju.10
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jul 2022 04:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:references:cc:from:in-reply-to:content-transfer-encoding;
	bh=xcv0l2eCPORlmIn8+KCj7hO8g9fRc65V3/8Qebu5JDw=;
	b=wWKToykg93qeOSNT5K0PWtOdx6rark6noWIxv9M/2mDy3UGX0sQth9AWL1jQhwG045
	dGXZEVLer1lfeLVHYb6gjt+BfhSfvca2mmrwvnVtbN0yw5uu+5WyWzlxLPsPIPCpEz/f
	W9BBZE25GVX4Y0Gbyqpp91dFs2E73q4fC2PVJDqicc8cXUmQaZANOlVDbGgBrFWvE0HN
	fyfTk9pmuC14dis9w0aKleSKXWYNv3s+MTVimhYTETTxvxE1zEsPMiFzwDnqJmhGAHOI
	/kad9hZZVjEvgXEr7zwHgNodUTXtYkNMGGsaZ70MKl766ztN5biNrw3AY9MoARphphGQ
	HHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:cc:from:in-reply-to
	:content-transfer-encoding;
	bh=xcv0l2eCPORlmIn8+KCj7hO8g9fRc65V3/8Qebu5JDw=;
	b=33ETQlyZSILjUSuljqlLM8qXidjpM60lrE4eAktLwYo5Qf+1oAmYm58wPwBnq7An0G
	xXAtiMfYhhIRB4j4ZjUdJ3TFrP3xGEgfo3yBBjrlj4GrXRRV5qRzFwcE6n2+Gp/sHlqO
	P+3xUeXYFRU+751PzR5OB8JsuGeS1dzQPsCmV88T/djzt6ChK+4SGa5jl2X5lTY+gqs1
	ZU1mINmk0eixVQZmIGJqdNoeiKZaRk1uSWE2bd5srOzWJRAQJCe23f1QauCX8z0CGGuj
	pAECu3fJ4NE7vZ79CQ2u+FgOqfsD3c+SKRck1d9v57/Zz1JtN2pHn0tbIeR7PeXCJ4Zx
	Gp6A==
X-Gm-Message-State: AJIora+ELU/971jSgf5liaSibsN+MafhewmV19hn7MomeBLhW/nX1dED
	4/L6PPstNuhvAZ/r2MaLv7+dvdP9qRwThVcimLc=
X-Google-Smtp-Source: AGRyM1sQic8xqtwXuY1EBSgBrbm0ofXHKHAZM6n3V96p8ZhVzGvuGvn53w8qkgAx3lUhyTfOe50A1A==
X-Received: by 2002:a17:907:96a2:b0:72e:e155:1331 with SMTP id
	hd34-20020a17090796a200b0072ee1551331mr24192211ejc.478.1658230291977;
	Tue, 19 Jul 2022 04:31:31 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	d25-20020aa7c1d9000000b0043a75f62155sm10359909edp.86.2022.07.19.04.31.31
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 Jul 2022 04:31:31 -0700 (PDT)
Message-ID: <acd5b1c9-d770-8db9-45a0-c78051cc3f59@linbit.com>
Date: Tue, 19 Jul 2022 13:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.10.0
Content-Language: en-US
To: Michael D Labriola <veggiemike@sourceruckus.org>
References: <20220718203421.963-1-veggiemike@sourceruckus.org>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220718203421.963-1-veggiemike@sourceruckus.org>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] compat: actually, bio_alloc now has 4 params
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

QW0gMTguMDcuMjIgdW0gMjI6MzQgc2NocmllYiBNaWNoYWVsIEQgTGFicmlvbGE6Cj4gVGhlIG9y
aWdpbmFsIGNvbXBhdCBjaGVjayBmb3IgdGhpcyBnb3QgYSBiaXQgd3JhcHBlZCBhcm91bmQgdGhl
IGF4bGUuCj4gQm90aCBiaW9fYWxsb2MoKSBhbmQgYmlvX2FsbG9jX2Jpb3NldCgpIGdyZXcgMiBt
b3JlIGFyZ3VtZW50cy4gIEFsbAo+IHRoZSBjb21tZW50cyBhbmQgZmlsZW5hbWVzIGZyb20gYjZk
NGQ1ODg1OTcgc2F5ICJiaW9fYWxsb2MgaGFzIDUKPiBwYXJhbXMiLCBidXQgaXQgd2FzIGFjdHVh
bGx5IGJpb19hbGxvY19iaW9zZXQoKSB0aGF0IG5vdyBoYXMgNSBwYXJhbXMuCj4gQW5kIHRoZSB0
ZXN0IHRha2VzIHRoZSA1IHBhcmFtcyBub3cgcmVxdWlyZWQgZm9yIGJpb19hbGxvY19iaW9zZXQo
KQo+IGFuZCBwYXNzZWQgdGhlbSBpbnRvIGJpb19hbGxvYygpLi4uIHdoaWNoIGNhdXNlcyB0aGUg
Y29ycmVjdCBjb2RlIGZvcgo+IDUuMTcga2VybmVscyB0byBnZXQgcGF0Y2hlZCBiYWNrIG91dCBl
cnJvbmVvdXNseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEQgTGFicmlvbGEgPHZlZ2dp
ZW1pa2VAc291cmNlcnVja3VzLm9yZz4KPiAtLS0KPiAgLi4ubm9faGFzXzVfcGFyYW1zLmNvY2Np
ID0+IGJpb19hbGxvY19fbm9faGFzXzRfcGFyYW1zLmNvY2NpfSB8IDAKPiAgZHJiZC9kcmJkLWtl
cm5lbC1jb21wYXQvZ2VuX3BhdGNoX25hbWVzLmMgICAgICAgICAgICAgICAgICAgICB8IDIgKy0K
PiAgLi4uL3tiaW9fYWxsb2NfaGFzXzVfcGFyYW1zLmMgPT4gYmlvX2FsbG9jX2hhc180X3BhcmFt
cy5jfSAgICB8IDQgKystLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPiAgcmVuYW1lIGRyYmQvZHJiZC1rZXJuZWwtY29tcGF0L2NvY2NpL3tiaW9f
YWxsb2NfX25vX2hhc181X3BhcmFtcy5jb2NjaSA9PiBiaW9fYWxsb2NfX25vX2hhc180X3BhcmFt
cy5jb2NjaX0gKDEwMCUpCj4gIHJlbmFtZSBkcmJkL2RyYmQta2VybmVsLWNvbXBhdC90ZXN0cy97
YmlvX2FsbG9jX2hhc181X3BhcmFtcy5jID0+IGJpb19hbGxvY19oYXNfNF9wYXJhbXMuY30gKDgw
JSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJiZC9kcmJkLWtlcm5lbC1jb21wYXQvY29jY2kvYmlvX2Fs
bG9jX19ub19oYXNfNV9wYXJhbXMuY29jY2kgYi9kcmJkL2RyYmQta2VybmVsLWNvbXBhdC9jb2Nj
aS9iaW9fYWxsb2NfX25vX2hhc180X3BhcmFtcy5jb2NjaQo+IHNpbWlsYXJpdHkgaW5kZXggMTAw
JQo+IHJlbmFtZSBmcm9tIGRyYmQvZHJiZC1rZXJuZWwtY29tcGF0L2NvY2NpL2Jpb19hbGxvY19f
bm9faGFzXzVfcGFyYW1zLmNvY2NpCj4gcmVuYW1lIHRvIGRyYmQvZHJiZC1rZXJuZWwtY29tcGF0
L2NvY2NpL2Jpb19hbGxvY19fbm9faGFzXzRfcGFyYW1zLmNvY2NpCj4gZGlmZiAtLWdpdCBhL2Ry
YmQvZHJiZC1rZXJuZWwtY29tcGF0L2dlbl9wYXRjaF9uYW1lcy5jIGIvZHJiZC9kcmJkLWtlcm5l
bC1jb21wYXQvZ2VuX3BhdGNoX25hbWVzLmMKPiBpbmRleCBlOThjM2Q0NC4uMTA3NGJiMTIgMTAw
NjQ0Cj4gLS0tIGEvZHJiZC9kcmJkLWtlcm5lbC1jb21wYXQvZ2VuX3BhdGNoX25hbWVzLmMKPiAr
KysgYi9kcmJkL2RyYmQta2VybmVsLWNvbXBhdC9nZW5fcGF0Y2hfbmFtZXMuYwo+IEBAIC0xMDIs
NyArMTAyLDcgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQo+ICAjZW5kaWYKPiAg
Cj4gIAlwYXRjaCgxLCAiYmlvX2FsbG9jIiwgdHJ1ZSwgZmFsc2UsCj4gLQkgICAgICBDT01QQVRf
QklPX0FMTE9DX0hBU181X1BBUkFNUywgImhhc181X3BhcmFtcyIpOwo+ICsJICAgICAgQ09NUEFU
X0JJT19BTExPQ19IQVNfNF9QQVJBTVMsICJoYXNfNF9wYXJhbXMiKTsKPiAgCj4gICNpZiAhZGVm
aW5lZChDT01QQVRfSEFWRV9CSU9fU0VUX0RFVikKPiAgCXBhdGNoKDEsICJiaW9fc2V0X2RldiIs
IHRydWUsIGZhbHNlLAo+IGRpZmYgLS1naXQgYS9kcmJkL2RyYmQta2VybmVsLWNvbXBhdC90ZXN0
cy9iaW9fYWxsb2NfaGFzXzVfcGFyYW1zLmMgYi9kcmJkL2RyYmQta2VybmVsLWNvbXBhdC90ZXN0
cy9iaW9fYWxsb2NfaGFzXzRfcGFyYW1zLmMKPiBzaW1pbGFyaXR5IGluZGV4IDgwJQo+IHJlbmFt
ZSBmcm9tIGRyYmQvZHJiZC1rZXJuZWwtY29tcGF0L3Rlc3RzL2Jpb19hbGxvY19oYXNfNV9wYXJh
bXMuYwo+IHJlbmFtZSB0byBkcmJkL2RyYmQta2VybmVsLWNvbXBhdC90ZXN0cy9iaW9fYWxsb2Nf
aGFzXzRfcGFyYW1zLmMKPiBpbmRleCAxYzI4ZjA0OS4uNjAwMGUxMDEgMTAwNjQ0Cj4gLS0tIGEv
ZHJiZC9kcmJkLWtlcm5lbC1jb21wYXQvdGVzdHMvYmlvX2FsbG9jX2hhc181X3BhcmFtcy5jCj4g
KysrIGIvZHJiZC9kcmJkLWtlcm5lbC1jb21wYXQvdGVzdHMvYmlvX2FsbG9jX2hhc180X3BhcmFt
cy5jCj4gQEAgLTYsNyArNiw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9iaW8uaD4KPiAgCj4gIHN0
cnVjdCBiaW8gKmZvbyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2LCB1bnNpZ25lZCBzaG9ydCBu
cl92ZWNzLAo+IC0JCXVuc2lnbmVkIGludCBvcGYsIGdmcF90IGdmcF9tYXNrLCBzdHJ1Y3QgYmlv
X3NldCAqYnMpCj4gKwkJdW5zaWduZWQgaW50IG9wZiwgZ2ZwX3QgZ2ZwX21hc2spCj4gIHsKPiAt
CXJldHVybiBiaW9fYWxsb2MoYmRldiwgbnJfdmVjcywgb3BmLCBnZnBfbWFzaywgYnMpOwo+ICsJ
cmV0dXJuIGJpb19hbGxvYyhiZGV2LCBucl92ZWNzLCBvcGYsIGdmcF9tYXNrKTsKPiAgfQoKRCdv
aCwgc2VlbXMgbGlrZSBJIGluZGVlZCBtaXhlZCB0aG9zZSB1cC4KR29vZCBjYXRjaCwgdGhhbmtz
IQoKQXBwbGllZCBhcyBodHRwczovL2dpdGh1Yi5jb20vTElOQklUL2RyYmQvY29tbWl0L2U0N2M2
NGEzNWZhZWI5YjA4MDc3MmIwNjhhNTYzMDk3NmNiMDc1NGQKCkknbSBnbGFkIHRvIGhhdmUgc29t
ZW9uZSBpbiB0aGUgY29tbXVuaXR5IHRvIGRvdWJsZS1jaGVjayBteSBzdHVmZiA6KQoKLS0gCkNo
cmlzdG9waCBCw7ZobXdhbGRlcgpMSU5CSVQgfCBLZWVwaW5nIHRoZSBEaWdpdGFsIFdvcmxkIFJ1
bm5pbmcKRFJCRCBIQSDigJQgIERpc2FzdGVyIFJlY292ZXJ5IOKAlCBTb2Z0d2FyZSBkZWZpbmVk
IFN0b3JhZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9s
aXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
