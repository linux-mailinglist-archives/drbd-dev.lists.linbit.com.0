Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F26B44EE406
	for <lists+drbd-dev@lfdr.de>; Fri,  1 Apr 2022 00:28:24 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E6B3F4205D4;
	Fri,  1 Apr 2022 00:28:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
	[209.85.218.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DBAC842017F
	for <drbd-dev@lists.linbit.com>; Fri,  1 Apr 2022 00:28:21 +0200 (CEST)
Received: by mail-ej1-f46.google.com with SMTP id lr4so2124502ejb.11
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 15:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=IfOtZRORB1RxFk7eCF0hr3qD4wSQzXzDaJoIfYDN2NA=;
	b=xglsZC/N7d9NU6+VLYNaqlcD4KR4g+Qg5eSJHkhmddVA0KfUaS89CceKU8AHno+Sa1
	xi8ecZ67yrkBx1kplPqrM9aLkDZ/IHn/t86IjTspKtLZOACmglt+Xi9nWOeDMshjL+Hf
	3+nHOmDv3Co85ofVCSajYYEFFEDIgnveaLGta7yEhFfv8uEdCq2SJ/Uuou9vr8fThSKX
	pLSMxFfv2nsy9BvivOXUIqrnYPSxViND0qiZ2skVt6JHAHSM6TdPY5QROOYtE63vkguG
	vPnv15XwKmoEjd0TWu1bM09kh6E+jQYHGu1tWL5Ipl7YUsEwvdaG6CguMYeOlKMHzIHX
	V+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=IfOtZRORB1RxFk7eCF0hr3qD4wSQzXzDaJoIfYDN2NA=;
	b=ehdEzrqyk41Gj5Da6p8Jt537BoiPWeAIaEyEzzuKSwvVS1OaIJnuNqz6EcneDfL3T4
	RN4XodpP9b7KLhKycK/OJ7Bl+AWd13QymPavrcPWRlHSSUx0R8DGIhvApECfPr1UsBXz
	UXvX2N0hQ2shx392oNXbkzyXYr2vaBCikOOoIM0qoCiWLNcsly2N7GPrYEUJE7+ctL3t
	7QEhsevEtiwMHMefIXTHyhQlR4+z+7Qq8x1sn4g2fKVwz7hKBwW+clRfTbStXrF0iwbs
	VO2bhDZWD1X6OQl8HLrYmY2kySzzorSvMjv1v7uLEglA89jCsNfyOnZ5AIePF/F83hWB
	UY5Q==
X-Gm-Message-State: AOAM532SAE3H7fqiS+Fhsjr7swxG8gbIaZvk+hRubqeQjd4LMsSzCA8W
	vCEkfmhNH3eloM6GJZWXrIoWs66W
X-Google-Smtp-Source: ABdhPJxbz4BRLoMPpfz9Pm2McOQMqgdtY8WdC4wri/gj911kG251S0NfI20VcrSlyyKg7x/7kc3m7w==
X-Received: by 2002:a17:906:7952:b0:6da:94c9:cccb with SMTP id
	l18-20020a170906795200b006da94c9cccbmr6686482ejo.469.1648765701281;
	Thu, 31 Mar 2022 15:28:21 -0700 (PDT)
Received: from [192.168.178.55] (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	y27-20020a170906519b00b006dfaf4466ebsm270582ejk.116.2022.03.31.15.28.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 31 Mar 2022 15:28:20 -0700 (PDT)
Message-ID: <4dcedb78-355f-ed1a-9af1-27e9e63b5643@linbit.com>
Date: Fri, 1 Apr 2022 00:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>
References: <20220331220349.885126-1-jakobkoschel@gmail.com>
	<20220331220349.885126-2-jakobkoschel@gmail.com>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20220331220349.885126-2-jakobkoschel@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, "Bos,
	H.J." <h.j.bos@vu.nl>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	linux-block@vger.kernel.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Mike Rapoport <rppt@kernel.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 2/2] drbd: remove check of list iterator
 against head past the loop body
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

QW0gMDEuMDQuMjIgdW0gMDA6MDMgc2NocmllYiBKYWtvYiBLb3NjaGVsOgo+IFdoZW4gbGlzdF9m
b3JfZWFjaF9lbnRyeSgpIGNvbXBsZXRlcyB0aGUgaXRlcmF0aW9uIG92ZXIgdGhlIHdob2xlIGxp
c3QKPiB3aXRob3V0IGJyZWFraW5nIHRoZSBsb29wLCB0aGUgaXRlcmF0b3IgdmFsdWUgd2lsbCBi
ZSBhIGJvZ3VzIHBvaW50ZXIKPiBjb21wdXRlZCBiYXNlZCBvbiB0aGUgaGVhZCBlbGVtZW50Lgo+
IAo+IFdoaWxlIGl0IGlzIHNhZmUgdG8gdXNlIHRoZSBwb2ludGVyIHRvIGRldGVybWluZSBpZiBp
dCB3YXMgY29tcHV0ZWQKPiBiYXNlZCBvbiB0aGUgaGVhZCBlbGVtZW50LCBlaXRoZXIgd2l0aCBs
aXN0X2VudHJ5X2lzX2hlYWQoKSBvcgo+ICZwb3MtPm1lbWJlciA9PSBoZWFkLCB1c2luZyB0aGUg
aXRlcmF0b3IgdmFyaWFibGUgYWZ0ZXIgdGhlIGxvb3Agc2hvdWxkCj4gYmUgYXZvaWRlZC4KPiAK
PiBJbiBwcmVwYXJhdGlvbiB0byBsaW1pdCB0aGUgc2NvcGUgb2YgYSBsaXN0IGl0ZXJhdG9yIHRv
IHRoZSBsaXN0Cj4gdHJhdmVyc2FsIGxvb3AsIHVzZSBhIGRlZGljYXRlZCBwb2ludGVyIHRvIHBv
aW50IHRvIHRoZSBmb3VuZCBlbGVtZW50IFsxXS4KPiAKPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvQ0FIay09d2dScl9EOENCLUQ5S2ctYz1FSHJlQXNrNVNxWFB3cjlZN2s5c0E2
Y1dYSjZ3QG1haWwuZ21haWwuY29tLyBbMV0KPiBTaWduZWQtb2ZmLWJ5OiBKYWtvYiBLb3NjaGVs
IDxqYWtvYmtvc2NoZWxAZ21haWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ibG9jay9kcmJkL2Ry
YmRfcmVxLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZXEuYyBiL2RyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX3JlcS5jCj4gaW5kZXggYzA0Mzk0NTE4YjA3Li5iMjU3MWRjNzdmZTYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVxLmMKPiArKysgYi9kcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9yZXEuYwo+IEBAIC0zMzIsMTcgKzMzMiwyMSBAQCBzdGF0aWMgdm9pZCBzZXRf
aWZfbnVsbF9yZXFfbmV4dChzdHJ1Y3QgZHJiZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsIHN0
cnVjdCBkcgo+ICAgc3RhdGljIHZvaWQgYWR2YW5jZV9jb25uX3JlcV9uZXh0KHN0cnVjdCBkcmJk
X3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgc3RydWN0IGRyYmRfcmVxdWVzdCAqcmVxKQo+ICAg
ewo+ICAgCXN0cnVjdCBkcmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24gPSBwZWVyX2RldmljZSA/
IHBlZXJfZGV2aWNlLT5jb25uZWN0aW9uIDogTlVMTDsKPiArCXN0cnVjdCBkcmJkX3JlcXVlc3Qg
Kml0ZXIgPSByZXE7Cj4gICAJaWYgKCFjb25uZWN0aW9uKQo+ICAgCQlyZXR1cm47Cj4gICAJaWYg
KGNvbm5lY3Rpb24tPnJlcV9uZXh0ICE9IHJlcSkKPiAgIAkJcmV0dXJuOwo+IC0JbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9jb250aW51ZShyZXEsICZjb25uZWN0aW9uLT50cmFuc2Zlcl9sb2csIHRsX3Jl
cXVlc3RzKSB7Cj4gLQkJY29uc3QgdW5zaWduZWQgcyA9IHJlcS0+cnFfc3RhdGU7Cj4gLQkJaWYg
KHMgJiBSUV9ORVRfUVVFVUVEKQo+ICsKPiArCXJlcSA9IE5VTEw7Cj4gKwlsaXN0X2Zvcl9lYWNo
X2VudHJ5X2NvbnRpbnVlKGl0ZXIsICZjb25uZWN0aW9uLT50cmFuc2Zlcl9sb2csIHRsX3JlcXVl
c3RzKSB7Cj4gKwkJY29uc3QgdW5zaWduZWQgaW50IHMgPSBpdGVyLT5ycV9zdGF0ZTsKPiArCj4g
KwkJaWYgKHMgJiBSUV9ORVRfUVVFVUVEKSB7Cj4gKwkJCXJlcSA9IGl0ZXI7Cj4gICAJCQlicmVh
azsKPiArCQl9Cj4gICAJfQo+IC0JaWYgKCZyZXEtPnRsX3JlcXVlc3RzID09ICZjb25uZWN0aW9u
LT50cmFuc2Zlcl9sb2cpCj4gLQkJcmVxID0gTlVMTDsKPiAgIAljb25uZWN0aW9uLT5yZXFfbmV4
dCA9IHJlcTsKPiAgIH0KPiAgIAo+IEBAIC0zNTgsMTcgKzM2MiwyMSBAQCBzdGF0aWMgdm9pZCBz
ZXRfaWZfbnVsbF9yZXFfYWNrX3BlbmRpbmcoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJf
ZGV2aWNlLCBzdAo+ICAgc3RhdGljIHZvaWQgYWR2YW5jZV9jb25uX3JlcV9hY2tfcGVuZGluZyhz
dHJ1Y3QgZHJiZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsIHN0cnVjdCBkcmJkX3JlcXVlc3Qg
KnJlcSkKPiAgIHsKPiAgIAlzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0aW9uID0gcGVl
cl9kZXZpY2UgPyBwZWVyX2RldmljZS0+Y29ubmVjdGlvbiA6IE5VTEw7Cj4gKwlzdHJ1Y3QgZHJi
ZF9yZXF1ZXN0ICppdGVyID0gcmVxOwo+ICAgCWlmICghY29ubmVjdGlvbikKPiAgIAkJcmV0dXJu
Owo+ICAgCWlmIChjb25uZWN0aW9uLT5yZXFfYWNrX3BlbmRpbmcgIT0gcmVxKQo+ICAgCQlyZXR1
cm47Cj4gLQlsaXN0X2Zvcl9lYWNoX2VudHJ5X2NvbnRpbnVlKHJlcSwgJmNvbm5lY3Rpb24tPnRy
YW5zZmVyX2xvZywgdGxfcmVxdWVzdHMpIHsKPiAtCQljb25zdCB1bnNpZ25lZCBzID0gcmVxLT5y
cV9zdGF0ZTsKPiAtCQlpZiAoKHMgJiBSUV9ORVRfU0VOVCkgJiYgKHMgJiBSUV9ORVRfUEVORElO
RykpCj4gKwo+ICsJcmVxID0gTlVMTDsKPiArCWxpc3RfZm9yX2VhY2hfZW50cnlfY29udGludWUo
aXRlciwgJmNvbm5lY3Rpb24tPnRyYW5zZmVyX2xvZywgdGxfcmVxdWVzdHMpIHsKPiArCQljb25z
dCB1bnNpZ25lZCBpbnQgcyA9IGl0ZXItPnJxX3N0YXRlOwo+ICsKPiArCQlpZiAoKHMgJiBSUV9O
RVRfU0VOVCkgJiYgKHMgJiBSUV9ORVRfUEVORElORykpIHsKPiArCQkJcmVxID0gaXRlcjsKPiAg
IAkJCWJyZWFrOwo+ICsJCX0KPiAgIAl9Cj4gLQlpZiAoJnJlcS0+dGxfcmVxdWVzdHMgPT0gJmNv
bm5lY3Rpb24tPnRyYW5zZmVyX2xvZykKPiAtCQlyZXEgPSBOVUxMOwo+ICAgCWNvbm5lY3Rpb24t
PnJlcV9hY2tfcGVuZGluZyA9IHJlcTsKPiAgIH0KPiAgIAo+IEBAIC0zODQsMTcgKzM5MiwyMSBA
QCBzdGF0aWMgdm9pZCBzZXRfaWZfbnVsbF9yZXFfbm90X25ldF9kb25lKHN0cnVjdCBkcmJkX3Bl
ZXJfZGV2aWNlICpwZWVyX2RldmljZSwgcwo+ICAgc3RhdGljIHZvaWQgYWR2YW5jZV9jb25uX3Jl
cV9ub3RfbmV0X2RvbmUoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlLCBzdHJ1
Y3QgZHJiZF9yZXF1ZXN0ICpyZXEpCj4gICB7Cj4gICAJc3RydWN0IGRyYmRfY29ubmVjdGlvbiAq
Y29ubmVjdGlvbiA9IHBlZXJfZGV2aWNlID8gcGVlcl9kZXZpY2UtPmNvbm5lY3Rpb24gOiBOVUxM
Owo+ICsJc3RydWN0IGRyYmRfcmVxdWVzdCAqaXRlciA9IHJlcTsKPiAgIAlpZiAoIWNvbm5lY3Rp
b24pCj4gICAJCXJldHVybjsKPiAgIAlpZiAoY29ubmVjdGlvbi0+cmVxX25vdF9uZXRfZG9uZSAh
PSByZXEpCj4gICAJCXJldHVybjsKPiAtCWxpc3RfZm9yX2VhY2hfZW50cnlfY29udGludWUocmVx
LCAmY29ubmVjdGlvbi0+dHJhbnNmZXJfbG9nLCB0bF9yZXF1ZXN0cykgewo+IC0JCWNvbnN0IHVu
c2lnbmVkIHMgPSByZXEtPnJxX3N0YXRlOwo+IC0JCWlmICgocyAmIFJRX05FVF9TRU5UKSAmJiAh
KHMgJiBSUV9ORVRfRE9ORSkpCj4gKwo+ICsJcmVxID0gTlVMTDsKPiArCWxpc3RfZm9yX2VhY2hf
ZW50cnlfY29udGludWUoaXRlciwgJmNvbm5lY3Rpb24tPnRyYW5zZmVyX2xvZywgdGxfcmVxdWVz
dHMpIHsKPiArCQljb25zdCB1bnNpZ25lZCBpbnQgcyA9IGl0ZXItPnJxX3N0YXRlOwo+ICsKPiAr
CQlpZiAoKHMgJiBSUV9ORVRfU0VOVCkgJiYgIShzICYgUlFfTkVUX0RPTkUpKSB7Cj4gKwkJCXJl
cSA9IGl0ZXI7Cj4gICAJCQlicmVhazsKPiArCQl9Cj4gICAJfQo+IC0JaWYgKCZyZXEtPnRsX3Jl
cXVlc3RzID09ICZjb25uZWN0aW9uLT50cmFuc2Zlcl9sb2cpCj4gLQkJcmVxID0gTlVMTDsKPiAg
IAljb25uZWN0aW9uLT5yZXFfbm90X25ldF9kb25lID0gcmVxOwo+ICAgfQo+ICAgCgpIaSBKYWtv
YiwKCkJvdGggb2YgdGhlc2UgbG9vayBnb29kIHRvIG1lLCB0aGFua3MuCgpSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNvbT4K
ClJlZ2FyZHMsIENocmlzdG9waApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNv
bQpodHRwczovL2xpc3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
