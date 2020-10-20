Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F2293E23
	for <lists+drbd-dev@lfdr.de>; Tue, 20 Oct 2020 16:07:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 76BFB420317;
	Tue, 20 Oct 2020 16:07:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 993D54202B6
	for <drbd-dev@lists.linbit.com>; Tue, 20 Oct 2020 16:07:29 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id n15so2324273wrq.2
	for <drbd-dev@lists.linbit.com>; Tue, 20 Oct 2020 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MjBb4DZvq5AK0iIvPTiZS1boixLqn2vbWS6pF4twIwE=;
	b=FzZEUSTQXHFmoRf2T3DmYpM7f07LYSkzPU2mpTPh2ljH2peVb3Tjmrb6ozx3Z7VtmC
	Bl9K75B02ajcLcGGdGXr3Jf/bWCl29ef5DfVcsqqujAficUWTBV1XT32mkG340/CrQhY
	81eNakDrPWCQ8YWVko8eUbu6oRu/NoJYdsLs2JKTW7sPucD2luhsq95hgY+b+MOCrKDS
	shVGhBTyIFA6jHbou/06LCPnqXmZSu6LzNRad3ieWqIzRh2wJPerIh4ZTVeHcEDI2AHk
	Vcndgz4w51oYgT4PzBKAtZv14IX47Mc+9PkMxUMYCBSHPaRoLqTd7xEbzfqxfZNZoR5W
	sHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MjBb4DZvq5AK0iIvPTiZS1boixLqn2vbWS6pF4twIwE=;
	b=jDFNalo8/vU4IH3plIE+ITkTyR1Th7xiB8Ldh9Aot8Cn51BWEKRHVgfMgWNqrRlU3c
	h7pHybplCPW9n0e/ZZB+uhlEVQYp+n/erygVWiwVQA3icuXLzJvFiq90LuAf9CWfN78k
	T3kMmwQZW6Ao2pK1UBNrj3+UUb2dLo8hFOqmNmrHlukNhlyV22A6EU4lZ9OKRO3CYvfe
	x1OLMRWGeJZ7AMr5mqZgmTMktfT28z56UVfNIYWsC7L9yJDujMUdI0rYJb4tozkxeylO
	LYRrUk8/2BwVEaBHckAeGsMU+/KzQCCkwWTZGSh1A5IBBnw8H9VylkMlwdGuRKwGP4RQ
	4Ujw==
X-Gm-Message-State: AOAM531TZkc9TNBdFTold3o5B6e2ETRUk/mFziMKrZaRyuszbfAOHbSN
	yBVWMCnJPm4Dd41S04l2WhNv/J+eXwE/Lk5TeVk=
X-Google-Smtp-Source: ABdhPJzMSMiiQf365TPlj8xG9yGTcjSDeZu8lU0ILCgV8/fZqCtkCP56yn2ZVHVLjmgSr/yxY0CeMw==
X-Received: by 2002:adf:f1cd:: with SMTP id z13mr3737318wro.197.1603202788737; 
	Tue, 20 Oct 2020 07:06:28 -0700 (PDT)
Received: from localhost.localdomain ([93.83.54.194])
	by smtp.gmail.com with ESMTPSA id
	j13sm3156538wru.86.2020.10.20.07.06.27
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 20 Oct 2020 07:06:28 -0700 (PDT)
To: Lukas Wunner <lukas@wunner.de>
References: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <1acf7b3a-6188-4c89-d07a-be162a598c77@linbit.com>
Date: Tue, 20 Oct 2020 16:06:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
Content-Language: en-US
Cc: Michael Hierweck <michael.hierweck@hostsharing.net>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Elimar Riesebieter <riesebie@lxtec.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH drbd-9.0] compat: __vmalloc() pgprot argument
 was removed in v5.8
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

T24gMTAvMTEvMjAgNjowNyBQTSwgTHVrYXMgV3VubmVyIHdyb3RlOgo+IENvbW1pdCB0b3J2YWxk
cy9saW51eEA4OGRjYTRjYTVhOTMgcmVtb3ZlZCB0aGUgcGdwcm90IGFyZ3VtZW50IGZyb20KPiBf
X3ZtYWxsb2MoKS4gIFRoZXJlJ3MgYSBzaW5nbGUgaW52b2NhdGlvbiBpbiBkcmJkX2JpdG1hcC5j
LiAgRHJvcCB0aGUKPiBhcmd1bWVudCB0byBzdGF5IGFzIGNsb3NlIGFzIHBvc3NpYmxlIHRvIHVw
c3RyZWFtIGFuZCBhcHBseSBhIGNvY2NpCj4gcGF0Y2ggZm9yIG9sZGVyIGtlcm5lbHMgd2hpY2gg
cmVpbnN0YXRlcyB0aGUgYWRkaXRpb25hbCBhcmd1bWVudC4KPiAKPiBSZXBvcnRlZC1ieTogTWlj
aGFlbCBIaWVyd2VjayA8bWljaGFlbC5oaWVyd2Vja0Bob3N0c2hhcmluZy5uZXQ+Cj4gU2lnbmVk
LW9mZi1ieTogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Cj4gLS0tCj4gICBkcmJkL2Ry
YmQta2VybmVsLWNvbXBhdC9jb2NjaS9fX3ZtYWxsb2NfX25vX2hhc18yX3BhcmFtcy5jb2NjaSB8
IDMgKysrCj4gICBkcmJkL2RyYmQta2VybmVsLWNvbXBhdC9nZW5fcGF0Y2hfbmFtZXMuYyAgICAg
ICAgICAgICAgICAgICAgICB8IDMgKysrCj4gICBkcmJkL2RyYmQta2VybmVsLWNvbXBhdC90ZXN0
cy9fX3ZtYWxsb2NfaGFzXzJfcGFyYW1zLmMgICAgICAgICB8IDggKysrKysrKysKPiAgIGRyYmQv
ZHJiZF9iaXRtYXAuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMyArLS0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcmJkL2RyYmQta2VybmVsLWNvbXBhdC9jb2Nj
aS9fX3ZtYWxsb2NfX25vX2hhc18yX3BhcmFtcy5jb2NjaQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyYmQvZHJiZC1rZXJuZWwtY29tcGF0L3Rlc3RzL19fdm1hbGxvY19oYXNfMl9wYXJhbXMuYwo+
IAo+IGRpZmYgLS1naXQgYS9kcmJkL2RyYmQta2VybmVsLWNvbXBhdC9jb2NjaS9fX3ZtYWxsb2Nf
X25vX2hhc18yX3BhcmFtcy5jb2NjaSBiL2RyYmQvZHJiZC1rZXJuZWwtY29tcGF0L2NvY2NpL19f
dm1hbGxvY19fbm9faGFzXzJfcGFyYW1zLmNvY2NpCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwLi4zMzU1ODFkCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyYmQvZHJiZC1r
ZXJuZWwtY29tcGF0L2NvY2NpL19fdm1hbGxvY19fbm9faGFzXzJfcGFyYW1zLmNvY2NpCj4gQEAg
LTAsMCArMSwzIEBACj4gK0BAIGV4cHJlc3Npb24gUywgRzsgQEAKPiArLSBfX3ZtYWxsb2MoUywg
RykKPiArKyBfX3ZtYWxsb2MoUywgRywgUEFHRV9LRVJORUwpCj4gZGlmZiAtLWdpdCBhL2RyYmQv
ZHJiZC1rZXJuZWwtY29tcGF0L2dlbl9wYXRjaF9uYW1lcy5jIGIvZHJiZC9kcmJkLWtlcm5lbC1j
b21wYXQvZ2VuX3BhdGNoX25hbWVzLmMKPiBpbmRleCA4ZDVhZjgxLi44NmU5ZDAyIDEwMDY0NAo+
IC0tLSBhL2RyYmQvZHJiZC1rZXJuZWwtY29tcGF0L2dlbl9wYXRjaF9uYW1lcy5jCj4gKysrIGIv
ZHJiZC9kcmJkLWtlcm5lbC1jb21wYXQvZ2VuX3BhdGNoX25hbWVzLmMKPiBAQCAtMzIzLDYgKzMy
Myw5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKPiAgIAlwYXRjaCgxLCAicGFy
dF9zdGF0X2giLCB0cnVlLCBmYWxzZSwKPiAgIAkgICAgICBDT01QQVRfSEFWRV9QQVJUX1NUQVRf
SCwgInByZXNlbnQiKTsKPiAgIAo+ICsJcGF0Y2goMSwgIl9fdm1hbGxvYyIsIHRydWUsIGZhbHNl
LAo+ICsJICAgICAgQ09NUEFUX19fVk1BTExPQ19IQVNfMl9QQVJBTVMsICJoYXNfMl9wYXJhbXMi
KTsKPiArCj4gICAvKiAjZGVmaW5lIEJMS0RFVl9JU1NVRV9aRVJPT1VUX0VYUE9SVEVEICovCj4g
ICAvKiAjZGVmaW5lIEJMS0RFVl9aRVJPX05PVU5NQVAgKi8KPiAgIAo+IGRpZmYgLS1naXQgYS9k
cmJkL2RyYmQta2VybmVsLWNvbXBhdC90ZXN0cy9fX3ZtYWxsb2NfaGFzXzJfcGFyYW1zLmMgYi9k
cmJkL2RyYmQta2VybmVsLWNvbXBhdC90ZXN0cy9fX3ZtYWxsb2NfaGFzXzJfcGFyYW1zLmMKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAuLjAwZTJjMjgKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvZHJiZC9kcmJkLWtlcm5lbC1jb21wYXQvdGVzdHMvX192bWFsbG9jX2hhc18y
X3BhcmFtcy5jCj4gQEAgLTAsMCArMSw4IEBACj4gKy8qIHsgInZlcnNpb24iOiAidjUuOC1yYzEi
LCAiY29tbWl0IjogIjg4ZGNhNGNhNWE5M2QyYzA5ZTViYmM2YTYyZmJmYzNhZjgzYzRmY2EiLCAi
Y29tbWVudCI6ICJwZ3Byb3QgYXJndW1lbnQgdG8gX192bWFsbG9jIHdhcyByZW1vdmVkIiwgImF1
dGhvciI6ICJDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4iLCAiZGF0ZSI6ICJNb24gSnVu
IDEgMjE6NTE6NDAgMjAyMCAtMDcwMCIgfSAqLwo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L3ZtYWxs
b2MuaD4KPiArCj4gK3ZvaWQgZm9vKHZvaWQpCj4gK3sKPiArCV9fdm1hbGxvYygwLCAwKTsKPiAr
fQo+IGRpZmYgLS1naXQgYS9kcmJkL2RyYmRfYml0bWFwLmMgYi9kcmJkL2RyYmRfYml0bWFwLmMK
PiBpbmRleCA0ZGJlZDI2Li5lMjNlZDVhIDEwMDY0NAo+IC0tLSBhL2RyYmQvZHJiZF9iaXRtYXAu
Ywo+ICsrKyBiL2RyYmQvZHJiZF9iaXRtYXAuYwo+IEBAIC0zNjYsOSArMzY2LDcgQEAgc3RhdGlj
IHN0cnVjdCBwYWdlICoqYm1fcmVhbGxvY19wYWdlcyhzdHJ1Y3QgZHJiZF9iaXRtYXAgKmIsIHVu
c2lnbmVkIGxvbmcgd2FudCkKPiAgIAluZXdfcGFnZXMgPSBremFsbG9jKGJ5dGVzLCBHRlBfTk9J
TyB8IF9fR0ZQX05PV0FSTik7Cj4gICAJaWYgKCFuZXdfcGFnZXMpIHsKPiAgIAkJbmV3X3BhZ2Vz
ID0gX192bWFsbG9jKGJ5dGVzLAo+IC0JCQkJR0ZQX05PSU8gfCBfX0dGUF9ISUdITUVNIHwgX19H
RlBfWkVSTywKPiAtCQkJCVBBR0VfS0VSTkVMKTsKPiArCQkJCSAgICAgIEdGUF9OT0lPIHwgX19H
RlBfSElHSE1FTSB8IF9fR0ZQX1pFUk8pOwo+ICAgCQlpZiAoIW5ld19wYWdlcykKPiAgIAkJCXJl
dHVybiBOVUxMOwo+ICAgCX0KPiAKCkFtYXppbmcuIFZlcnkgY29vbCB0byBoYXZlIHNvbWVvbmUg
ZXh0ZXJuYWwgZmlndXJlIG91dCBhbmQgY29udHJpYnV0ZSB0byAKc3VjaCBhIGNvbXBsZXggYW5k
IG5pY2hlIHBhcnQgb2YgZHJiZCDigJMgaXQncyBtdWNoIGFwcHJlY2lhdGVkIQoKQXBwbGllZCBp
bnRlcm5hbGx5LCB3aWxsIGJlIHJlbGVhc2VkIHdpdGggdGhlIG5leHQgdmVyc2lvbi4gVGhhbmtz
IGFnYWluIQoKUmVnYXJkcywKQ2hyaXN0b3BoCgotLSAKQ2hyaXN0b3BoIELDtmhtd2FsZGVyCkxJ
TkJJVCB8IEtlZXBpbmcgdGhlIERpZ2l0YWwgV29ybGQgUnVubmluZwpEUkJEIEhBIOKAlCAgRGlz
YXN0ZXIgUmVjb3Zlcnkg4oCUIFNvZnR3YXJlIGRlZmluZWQgU3RvcmFnZQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QK
ZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kcmJkLWRldgo=
