Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CD7F5804
	for <lists+drbd-dev@lfdr.de>; Thu, 23 Nov 2023 07:06:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F273E4202BF;
	Thu, 23 Nov 2023 07:06:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
	[209.85.219.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C4F04201DD
	for <drbd-dev@lists.linbit.com>; Thu, 23 Nov 2023 07:06:42 +0100 (CET)
Received: by mail-yb1-f174.google.com with SMTP id
	3f1490d57ef6-db4422fff15so54076276.1
	for <drbd-dev@lists.linbit.com>; Wed, 22 Nov 2023 22:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1700719602;
	x=1701324402; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=nKzcjkpdLBcAalQGl/rGpNy9+9yUAM9PXemYx2yGIkc=;
	b=OjM7walkR9YENTaPHFyhWgMNxl7Q2gpQk8rj/iiJ5XZoxL4cvaJzo7jH8Q5P8SIS6e
	BphKTI1smw0N3AYlJBYbXXVUP060DNwNRdFWK0EAX7O7+0Be0EabMQPTa5rj6yPJUboI
	NrRBn3EnvqeGaArXW2v2w/ITTXw5AsdxBl+ZCaqcvRNLC9qbvr0omwsY+MBwfSPowHPX
	XtuLv0975aWvhNY5y1E88oGd8dNhu0e7KhNW6HrL2acM02W5XXWE7p7tvl7SgIoyCkv8
	TPAZXOv0X19SHLXpvhk1AGG3f+8CJkjgDVe4XOx05Pk+6SAINlcLYjcrww6SOgDz7rgK
	R1ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1700719602; x=1701324402;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=nKzcjkpdLBcAalQGl/rGpNy9+9yUAM9PXemYx2yGIkc=;
	b=iCqBoA1YiGMjwy7fUF6BRJVMsX1rHJ82JEG2krJlHCt6c9KmC92LtZeo+IGEVOkgwE
	FzfcYnZkiZaxDQKgjHLiUxIyZiAwJSaKjgPcPks2z2YN4Ey0rt25wTh0BksEMzFzjq20
	h6UNANIF6WVs7ULCDDKi6L36scVbKPPl+LmbQw8kuQPm98ZxLn4K0aCHte73wtsq6IJi
	J1NcCOUhWoYLqILzvOOPdnGTA7j6WJqKHTzoTFHb+ax05L7UPhgYWlaZlu0amrC+jXRK
	0wlCd6NeMDYmoJexQyGhKlWDNZuyqkMG8U8zLEgDwRMONryuAhniIdMhCk4qbuBXHG96
	tOGQ==
X-Gm-Message-State: AOJu0Yx58qc5x6YRtANbItrvRJ9Ow2rz3ERKEfCd/byZFXMoMx03nKBi
	JFOw3J41a1D9oljtMIUDWwlDzXzN4onMCO/0C8y8prxq
X-Google-Smtp-Source: AGHT+IE5rLLdWEyAUlcm/4P1GEs7kVR1QJgc29M5MAcKNIUGqNbuE71ffiZbhDSqPrfQD8d49t3iKAEh4JrGQddRnIY=
X-Received: by 2002:a25:4d88:0:b0:da0:411b:ef19 with SMTP id
	a130-20020a254d88000000b00da0411bef19mr3916313ybb.1.1700719602108;
	Wed, 22 Nov 2023 22:06:42 -0800 (PST)
MIME-Version: 1.0
References: <20231122032510.24233-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20231122032510.24233-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Thu, 23 Nov 2023 06:06:30 +0000
Message-ID: <CADGDV=XMD+b6iNEVih7x4FN+PCzyj0VqgrgBhUwZff+G-2_d_w@mail.gmail.com>
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: when change susp_uuid[NEW] to true,
 make sure susp_uuid[OLD] is false
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

SGVsbG8gWmhlbmdiaW5nLAoKVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dC4gSSBjcmVh
dGVkIGEgbGl0dGxlIGJpdCBkaWZmZXJlbnQgcGF0Y2guCkZpcnN0LCB0aGUgc2FuaXRpemVfc3Rh
dGUoKSBmdW5jdGlvbiBzaG91bGQgY2xlYW4gdXAgdGhlIG5ldyBzdGF0ZSwKYnV0IEkgdGhpbmsg
aXQgc2hvdWxkIG5ldmVyIGNoYW5nZSB0aGUgb2xkIHN0YXRlLgpJdCBjYW4gbm90IHJld3JpdGUg
aGlzdG9yeS4KU2Vjb25kLCB3ZSBkbyBub3Qgd2FudCB0byBjcmVhdGUgdHdvIG5ldyBjdXJyZW50
LXV1aWRzIHdoaWxlIEkvTyBpcyBmcm96ZW4uCgogICAgZHJiZDogZml4IHN1c3BfdXVpZCBjbGVh
cmluZwoKICAgSSBpbnRyb2R1Y2VkIHN1c3BfdXVpZCBmb3Iga2VlcGluZyBhIHJlc291cmNlIGxv
bmdlciBzdXNwZW5kZWQgZm9yCiAgIHdyaXRpbmcgYSBuZXcgY3VycmVudC11dWlkLgogICBCdXQg
aW4gdGhlIGZvbGxvd2luZyBzY2VuYXJpbywgaXQgZmFpbGVkIHRvIGNsZWFyIHRoZSBzdXNwX3V1
aWQgYml0OgoKICAgIDEuIFRoZSBuZXR3b3JrIGNvbm5lY3Rpb24gYmV0d2VlbiBhIHByaW1hcnkg
YW5kIHNlY29uZGFyeSBub2RlCiAgICBmYWlscy4gVGhlIHByaW1hcnkgaGFzIHRoZSBzZXR0aW5n
IHF1b3J1bT0yLiBJTyBmcmVlemVzIG9uIHRoZQogICAgcHJpbWFyeSBub2RlLgoKICAgIDIuIFRo
ZSB1c2VyIGNoYW5nZXMgdGhlIHF1b3J1bSBzZXR0aW5nIGZyb20gMiB0byBvbmUuIFRoZSBwcmlt
YXJ5CiAgICBub2RlIGdlbmVyYXRlcyBhIG5ldyBjdXJyZW50LXV1aWQgYW5kIGNsZWFycyB0aGUg
c3VzcF91dWlkIGJpdCBpbiBhCiAgICBzZWNvbmQgc3RhdGUgY2hhbmdlLgoKICAgIDMuIElmLCBk
dXJpbmcgdGhlIHNlY29uZCBzdGF0ZSBjaGFuZ2UsIGFub3RoZXIgY29uZGl0aW9uIGZvciBjcmVh
dGluZwogICAgYSBuZXcgY3VycmVudCBVVUlEIGV2YWx1YXRlcyB0byB0cnVlLCB0aGUgY29kZSBm
YWlscyB0byBjbGVhciB0aGUKICAgIHN1c3Blbl91dWlkIGJpdC4KCiAgIFRoZSBzZWNvbmQgYXR0
ZW1wdCB0byBjcmVhdGUgYSBuZXcgY3VycmVudC11dWlkIGdldHMgaWdub3JlZCBzaW5jZSBpdAog
ICBpcyBwb2ludGxlc3MgdG8gY3JlYXRlIHR3byBjdXJyZW50LXV1aWRzIHdoaWxlIEkvTyBpcyBm
cm96ZW4uCgogICBGaXhlczogZDQ3Zjc0NTZhYiAoImRyYmQ6IGNyZWF0ZSBuZXcgVVVJRCBiZWZv
cmUgcmVzdW1pbmcgSU8gdXBvbgogICByZWdhaW5pbmcgcXVvcnVtIikKCiAgIENvLWRldmVsb3Bl
ZC1ieTogemhlbmdiaW5nLmh1YW5nIDx6aGVuZ2JpbmcuaHVhbmdAZWFzeXN0YWNrLmNuPgoKZGlm
ZiAtLWdpdCBhL2RyYmQvZHJiZF9zdGF0ZS5jIGIvZHJiZC9kcmJkX3N0YXRlLmMKaW5kZXggZTM1
MTUwMzQwLi4zMTZkM2ZkMzkgMTAwNjQ0Ci0tLSBhL2RyYmQvZHJiZF9zdGF0ZS5jCisrKyBiL2Ry
YmQvZHJiZF9zdGF0ZS5jCkBAIC00MTg5LDcgKzQxODksNyBAQCBzdGF0aWMgaW50IHdfYWZ0ZXJf
c3RhdGVfY2hhbmdlKHN0cnVjdCBkcmJkX3dvcmsKKncsIGludCB1bnVzZWQpCiAgICAgICAgICAg
ICAgICAgICAgICAgc3RpbGxfY29ubmVjdGVkID0gdHJ1ZTsKICAgICAgIH0KCi0gICAgICAgaWYg
KCFzdXNwX3V1aWRbT0xEXSAmJiBzdXNwX3V1aWRbTkVXXSkgeworICAgICAgIGlmIChzdXNwX3V1
aWRbTkVXXSkgewogICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGlycV9mbGFnczsKCiAgICAg
ICAgICAgICAgIGJlZ2luX3N0YXRlX2NoYW5nZShyZXNvdXJjZSwgJmlycV9mbGFncywgQ1NfVkVS
Qk9TRSk7CgoKSSBnaXZlIHRoaXMgdG8gaW50ZXJuYWwgcmV2aWV3IGZvciBtZXJnaW5nLgoKYmVz
dCByZWdhcmRzLAogUGhpbGlwcAoKCk9uIFdlZCwgTm92IDIyLCAyMDIzIGF0IDQ6MjXigK9BTSB6
aGVuZ2JpbmcuaHVhbmcKPHpoZW5nYmluZy5odWFuZ0BlYXN5c3RhY2suY24+IHdyb3RlOgo+Cj4g
VGhlIHByb2JsZW0gc2NlbmFyaW8gaXMgYXMgZm9sbG93czoKPgo+IDEuIGRyYmQgaXMgYnVpbHQg
b24gdHdvIG5vZGVzLCByb2xlIGlzIHByaW1hcnkgYW5kIHNlY29uZGFyeSwgcXVvcnVtIGlzIDIu
Cj4gICAgdGhlbiBkcmJkJ3MgbmV0d29yayBmYWlscy4gSU8gd2lsbCBiZSBzdXNwZW5kZWQuCj4g
Mi4gcHJpbWFyeSBtb2RpZnkgcXVvcnVtIHRvIDEsIGR1cmluZyB0aGlzIHN0YXRlIGNoYW5nZSwK
PiAgICBkcmJkIHdpbGwgc2V0IHN1c3BfdXVpZFtORVddIHRvIHRydWUgYW5kIGdlbmVyYXRlIGEg
bmV3IFVVSUQuCj4gMy4gdGhlbiBpbiB3X2FmdGVyX3N0YXRlX2NoYW5nZSwgc3RhcnQgdGhlIHNl
Y29uZCBzdGF0ZSBjaGFuZ2UsCj4gICAgc2V0IHN1c3BfdXVpZFtORVddIHRvIGZhbHNlLiBidXQg
ZHVyaW5nIHRoZSBzZWNvbmQgc3RhdGUgY2hhbmdlLAo+ICAgIGl0J3MgcG9zc2libGUgdG8gZmlu
ZCBORVdfQ1VSX1VVSUQgZmxhZyB3YXMgc2V0IGJ5IG90aGVycy4KPiAgICB0aGVuIHNhbml0aXpl
X3N0YXRlKCkgd2lsbCBzZXQgc3VzcF91dWlkW05FV10gdG8gdHJ1ZS4KPgo+IEZpbmFsbHkgc3Vz
cF91dWlkIHZhbHVlIGlzIHt0cnVlLCB0cnVlfSwgSU8gaXMgZnJvemVuLgo+IEFuZCB0aGVyZSBp
cyBubyB3YXkgdG8gc2V0IHN1c3BfdXVpZCB0byBmYWxzZSBhZnRlciB0aGF0Lgo+Cj4gU28sIHdo
aWxlIHN1c3BfdXVpZFtORVddIGlzIHNldCB0byB0cnVlLCB3ZSB3YW50IHN1c3BfdXVpZFtPTERd
IHRvIGJlIGZhbHNlLgo+Cj4gRml4ZXM6IGQ0N2Y3NDU2YWIgKCJkcmJkOiBjcmVhdGUgbmV3IFVV
SUQgYmVmb3JlIHJlc3VtaW5nIElPIHVwb24gcmVnYWluaW5nIHF1b3J1bSIpCj4gU2lnbmVkLW9m
Zi1ieTogemhlbmdiaW5nLmh1YW5nIDx6aGVuZ2JpbmcuaHVhbmdAZWFzeXN0YWNrLmNuPgo+IC0t
LQo+ICBkcmJkL2RyYmRfc3RhdGUuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPgo+IGRpZmYgLS1naXQgYS9kcmJkL2RyYmRfc3RhdGUuYyBiL2RyYmQvZHJiZF9zdGF0
ZS5jCj4gaW5kZXggZTM1MTUwMzQwLi4wZGVkZDJkYWUgMTAwNjQ0Cj4gLS0tIGEvZHJiZC9kcmJk
X3N0YXRlLmMKPiArKysgYi9kcmJkL2RyYmRfc3RhdGUuYwo+IEBAIC0yMzU2LDYgKzIzNTYsNyBA
QCBzdGF0aWMgdm9pZCBzYW5pdGl6ZV9zdGF0ZShzdHJ1Y3QgZHJiZF9yZXNvdXJjZSAqcmVzb3Vy
Y2UpCj4gICAgICAgICBpZiAocmVzb3VyY2VfaXNfc3VzcGVuZGVkKHJlc291cmNlLCBPTEQpICYm
ICFyZXNvdXJjZV9pc19zdXNwZW5kZWQocmVzb3VyY2UsIE5FVykpIHsKPiAgICAgICAgICAgICAg
ICAgaWRyX2Zvcl9lYWNoX2VudHJ5KCZyZXNvdXJjZS0+ZGV2aWNlcywgZGV2aWNlLCB2bnIpIHsK
PiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAodGVzdF9iaXQoTkVXX0NVUl9VVUlELCAmZGV2
aWNlLT5mbGFncykpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlc291cmNl
LT5zdXNwX3V1aWRbT0xEXSA9IGZhbHNlOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVzb3VyY2UtPnN1c3BfdXVpZFtORVddID0gdHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiAtLQo+IDIu
MTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
YmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlz
dHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
