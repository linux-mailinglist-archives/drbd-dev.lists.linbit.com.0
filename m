Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F374F6988
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:05:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A2D2420FD8;
	Wed,  6 Apr 2022 21:05:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 574F9420FCC
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:05:17 +0200 (CEST)
Received: by mail-ej1-f49.google.com with SMTP id n6so6157797ejc.13
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qfxFWJFZ6uw2agXHgOvG4u2eDOtbo0NRWmwVpn4uFPA=;
	b=Fx6Uzt6LOot/haJHKSHSwXct2yt9GFO4Y+pzzAVJq+RpsGqBTpxSYkyR9QFt7Y0cLD
	kQxZ1vVDQ7f3QAoHSIG9u5Q3r6tBdOc3EbnYSkMLTr4QM1jbq3UZDKVGAiMfH7bG5YXE
	jJYEf4EuB+iDCS6kGeOsokexim4cusMplStRE1+lq5+0ObBGJhyqoNcoGBjcfYPwJV42
	RK6bnZFLhHVqtvgSyb88PiE6n42DbDIAVYOUqhZ3ULxnGeH6EWbxxq6LQF+saZUMu4XA
	FQKPMrrX9xfisuqVFIcAoplgPEjFtJln0yzkQ6jyBu4WMniucMTHvmEKbFkesaCYihMy
	p3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qfxFWJFZ6uw2agXHgOvG4u2eDOtbo0NRWmwVpn4uFPA=;
	b=kdjSMFjdCIQJUBBtl0MYH+k68WuTNk8Pz8jsjOrubv/rALPfNxeaiYmcXf4H2tb/o+
	5EdvBEKKyawG2KXuhN6VWdlR8UmQOWdnEIKQ2eCt3vWQQvypZolyB/7C6H+uEqDYKZKK
	BLL2++QazHDb/kvE9aIDYJEkd+PeqcIMKkoiGVvhSPZSFOUSaYxgCvSVh51+gOuQuIPd
	qPO227R3YGTfiyNFqVinu8an64Vr4Kkf6Q6GLGlJEUlw1DXZCdtZfszht9bM7U4AoXcN
	TbJP10tL+/K72qxbVgwQe1SEowuI8f4HIxAjJR+j+n3onnaB/+/Yd2udJqu5V77TwxFk
	ED1Q==
X-Gm-Message-State: AOAM532OSAPI2WldX1NsAft1go0PYY+qNXMW+WM0JCu7+/5MyJXaHAu3
	evA0CG/Wvs2VDKsSBgtP1c+S0xXf
X-Google-Smtp-Source: ABdhPJzNa8Nk7IZLK4W0O/SXUB4IqOz2lnsHa91HVJ6qB8thGBlO43hlkjSUFd9q3q4sAFC1DvyuoA==
X-Received: by 2002:a17:906:6841:b0:6cf:9c02:8965 with SMTP id
	a1-20020a170906684100b006cf9c028965mr9570039ejs.440.1649271916774;
	Wed, 06 Apr 2022 12:05:16 -0700 (PDT)
Received: from localhost (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	hq39-20020a1709073f2700b006dfc58efab9sm6897892ejc.73.2022.04.06.12.05.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Apr 2022 12:05:16 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  6 Apr 2022 21:04:43 +0200
Message-Id: <20220406190445.1937206-2-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
References: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/3] drbd: Fix five use after free bugs in
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

RnJvbTogTHYgWXVubG9uZyA8bHlsMjAxOUBtYWlsLnVzdGMuZWR1LmNuPgoKSW4gZ2V0X2luaXRp
YWxfc3RhdGUsIGl0IGNhbGxzIG5vdGlmeV9pbml0aWFsX3N0YXRlX2RvbmUoc2tiLC4uKSBpZgpj
Yi0+YXJnc1s1XT09MS4gSWYgZ2VubG1zZ19wdXQoKSBmYWlsZWQgaW4gbm90aWZ5X2luaXRpYWxf
c3RhdGVfZG9uZSgpLAp0aGUgc2tiIHdpbGwgYmUgZnJlZWQgYnkgbmxtc2dfZnJlZShza2IpLgpU
aGVuIGdldF9pbml0aWFsX3N0YXRlIHdpbGwgZ290byBvdXQgYW5kIHRoZSBmcmVlZCBza2Igd2ls
bCBiZSB1c2VkIGJ5CnJldHVybiB2YWx1ZSBza2ItPmxlbiwgd2hpY2ggaXMgYSB1YWYgYnVnLgoK
V2hhdCdzIHdvcnNlLCB0aGUgc2FtZSBwcm9ibGVtIGdvZXMgZXZlbiBmdXJ0aGVyOiBza2IgY2Fu
IGFsc28gYmUKZnJlZWQgaW4gdGhlIG5vdGlmeV8qX3N0YXRlX2NoYW5nZSAtPiBub3RpZnlfKl9z
dGF0ZSBjYWxscyBiZWxvdy4KVGh1cyA0IGFkZGl0aW9uYWwgdWFmIGJ1Z3MgaGFwcGVuZWQuCgpN
eSBwYXRjaCBsZXRzIHRoZSBwcm9ibGVtIGNhbGxlZSBmdW5jdGlvbnM6IG5vdGlmeV9pbml0aWFs
X3N0YXRlX2RvbmUKYW5kIG5vdGlmeV8qX3N0YXRlX2NoYW5nZSByZXR1cm4gYW4gZXJyb3IgY29k
ZSBpZiBlcnJvcnMgaGFwcGVuLgpTbyB0aGF0IHRoZSBlcnJvciBjb2RlcyBjb3VsZCBiZSBwcm9w
YWdhdGVkIGFuZCB0aGUgdWFmIGJ1Z3MgY2FuIGJlIGF2b2lkLgoKdjIgcmVwb3J0cyBhIGNvbXBp
bGF0aW9uIHdhcm5pbmcuIFRoaXMgdjMgZml4ZWQgdGhpcyB3YXJuaW5nIGFuZCBidWlsdApzdWNj
ZXNzZnVsbHkgaW4gbXkgbG9jYWwgZW52aXJvbm1lbnQgd2l0aCBubyBhZGRpdGlvbmFsIHdhcm5p
bmdzLgp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzE0MzUyMTgv
CgpGaXhlczogYTI5NzI4NDYzYjI1NCAoImRyYmQ6IEJhY2twb3J0IHRoZSAiZXZlbnRzMiIgY29t
bWFuZCIpClNpZ25lZC1vZmYtYnk6IEx2IFl1bmxvbmcgPGx5bDIwMTlAbWFpbC51c3RjLmVkdS5j
bj4KUmV2aWV3ZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2Fs
ZGVyQGxpbmJpdC5jb20+Ci0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmggICAgICAg
ICAgfCAgOCArKy0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYyAgICAgICAgICAgfCA0
MSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3Rh
dGUuYyAgICAgICAgfCAxOCArKysrKy0tLS0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3Rh
dGVfY2hhbmdlLmggfCAgOCArKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCsp
LCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9p
bnQuaCBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX2ludC5oCmluZGV4IDRiNTVlODY0YTBhMy4u
NGQzZWZhYTIwYjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaAor
KysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaApAQCAtMTYzOCwyMiArMTYzOCwyMiBA
QCBzdHJ1Y3Qgc2liX2luZm8gewogfTsKIHZvaWQgZHJiZF9iY2FzdF9ldmVudChzdHJ1Y3QgZHJi
ZF9kZXZpY2UgKmRldmljZSwgY29uc3Qgc3RydWN0IHNpYl9pbmZvICpzaWIpOwogCi1leHRlcm4g
dm9pZCBub3RpZnlfcmVzb3VyY2Vfc3RhdGUoc3RydWN0IHNrX2J1ZmYgKiwKK2V4dGVybiBpbnQg
bm90aWZ5X3Jlc291cmNlX3N0YXRlKHN0cnVjdCBza19idWZmICosCiAJCQkJICB1bnNpZ25lZCBp
bnQsCiAJCQkJICBzdHJ1Y3QgZHJiZF9yZXNvdXJjZSAqLAogCQkJCSAgc3RydWN0IHJlc291cmNl
X2luZm8gKiwKIAkJCQkgIGVudW0gZHJiZF9ub3RpZmljYXRpb25fdHlwZSk7Ci1leHRlcm4gdm9p
ZCBub3RpZnlfZGV2aWNlX3N0YXRlKHN0cnVjdCBza19idWZmICosCitleHRlcm4gaW50IG5vdGlm
eV9kZXZpY2Vfc3RhdGUoc3RydWN0IHNrX2J1ZmYgKiwKIAkJCQl1bnNpZ25lZCBpbnQsCiAJCQkJ
c3RydWN0IGRyYmRfZGV2aWNlICosCiAJCQkJc3RydWN0IGRldmljZV9pbmZvICosCiAJCQkJZW51
bSBkcmJkX25vdGlmaWNhdGlvbl90eXBlKTsKLWV4dGVybiB2b2lkIG5vdGlmeV9jb25uZWN0aW9u
X3N0YXRlKHN0cnVjdCBza19idWZmICosCitleHRlcm4gaW50IG5vdGlmeV9jb25uZWN0aW9uX3N0
YXRlKHN0cnVjdCBza19idWZmICosCiAJCQkJICAgIHVuc2lnbmVkIGludCwKIAkJCQkgICAgc3Ry
dWN0IGRyYmRfY29ubmVjdGlvbiAqLAogCQkJCSAgICBzdHJ1Y3QgY29ubmVjdGlvbl9pbmZvICos
CiAJCQkJICAgIGVudW0gZHJiZF9ub3RpZmljYXRpb25fdHlwZSk7Ci1leHRlcm4gdm9pZCBub3Rp
ZnlfcGVlcl9kZXZpY2Vfc3RhdGUoc3RydWN0IHNrX2J1ZmYgKiwKK2V4dGVybiBpbnQgbm90aWZ5
X3BlZXJfZGV2aWNlX3N0YXRlKHN0cnVjdCBza19idWZmICosCiAJCQkJICAgICB1bnNpZ25lZCBp
bnQsCiAJCQkJICAgICBzdHJ1Y3QgZHJiZF9wZWVyX2RldmljZSAqLAogCQkJCSAgICAgc3RydWN0
IHBlZXJfZGV2aWNlX2luZm8gKiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X25sLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jCmluZGV4IDAyMDMwYzljNGQzYi4u
YjcyMTZjMTg2YmE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jCisr
KyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKQEAgLTQ1NDksNyArNDU0OSw3IEBAIHN0
YXRpYyBpbnQgbmxhX3B1dF9ub3RpZmljYXRpb25faGVhZGVyKHN0cnVjdCBza19idWZmICptc2cs
CiAJcmV0dXJuIGRyYmRfbm90aWZpY2F0aW9uX2hlYWRlcl90b19za2IobXNnLCAmbmgsIHRydWUp
OwogfQogCi12b2lkIG5vdGlmeV9yZXNvdXJjZV9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAor
aW50IG5vdGlmeV9yZXNvdXJjZV9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCQkJICAgdW5z
aWduZWQgaW50IHNlcSwKIAkJCSAgIHN0cnVjdCBkcmJkX3Jlc291cmNlICpyZXNvdXJjZSwKIAkJ
CSAgIHN0cnVjdCByZXNvdXJjZV9pbmZvICpyZXNvdXJjZV9pbmZvLApAQCAtNDU5MSwxNiArNDU5
MSwxNyBAQCB2b2lkIG5vdGlmeV9yZXNvdXJjZV9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAog
CQlpZiAoZXJyICYmIGVyciAhPSAtRVNSQ0gpCiAJCQlnb3RvIGZhaWxlZDsKIAl9Ci0JcmV0dXJu
OworCXJldHVybiAwOwogCiBubGFfcHV0X2ZhaWx1cmU6CiAJbmxtc2dfZnJlZShza2IpOwogZmFp
bGVkOgogCWRyYmRfZXJyKHJlc291cmNlLCAiRXJyb3IgJWQgd2hpbGUgYnJvYWRjYXN0aW5nIGV2
ZW50LiBFdmVudCBzZXE6JXVcbiIsCiAJCQllcnIsIHNlcSk7CisJcmV0dXJuIGVycjsKIH0KIAot
dm9pZCBub3RpZnlfZGV2aWNlX3N0YXRlKHN0cnVjdCBza19idWZmICpza2IsCitpbnQgbm90aWZ5
X2RldmljZV9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCQkJIHVuc2lnbmVkIGludCBzZXEs
CiAJCQkgc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsCiAJCQkgc3RydWN0IGRldmljZV9pbmZv
ICpkZXZpY2VfaW5mbywKQEAgLTQ2NDAsMTYgKzQ2NDEsMTcgQEAgdm9pZCBub3RpZnlfZGV2aWNl
X3N0YXRlKHN0cnVjdCBza19idWZmICpza2IsCiAJCWlmIChlcnIgJiYgZXJyICE9IC1FU1JDSCkK
IAkJCWdvdG8gZmFpbGVkOwogCX0KLQlyZXR1cm47CisJcmV0dXJuIDA7CiAKIG5sYV9wdXRfZmFp
bHVyZToKIAlubG1zZ19mcmVlKHNrYik7CiBmYWlsZWQ6CiAJZHJiZF9lcnIoZGV2aWNlLCAiRXJy
b3IgJWQgd2hpbGUgYnJvYWRjYXN0aW5nIGV2ZW50LiBFdmVudCBzZXE6JXVcbiIsCiAJCSBlcnIs
IHNlcSk7CisJcmV0dXJuIGVycjsKIH0KIAotdm9pZCBub3RpZnlfY29ubmVjdGlvbl9zdGF0ZShz
dHJ1Y3Qgc2tfYnVmZiAqc2tiLAoraW50IG5vdGlmeV9jb25uZWN0aW9uX3N0YXRlKHN0cnVjdCBz
a19idWZmICpza2IsCiAJCQkgICAgIHVuc2lnbmVkIGludCBzZXEsCiAJCQkgICAgIHN0cnVjdCBk
cmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24sCiAJCQkgICAgIHN0cnVjdCBjb25uZWN0aW9uX2lu
Zm8gKmNvbm5lY3Rpb25faW5mbywKQEAgLTQ2ODksMTYgKzQ2OTEsMTcgQEAgdm9pZCBub3RpZnlf
Y29ubmVjdGlvbl9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCQlpZiAoZXJyICYmIGVyciAh
PSAtRVNSQ0gpCiAJCQlnb3RvIGZhaWxlZDsKIAl9Ci0JcmV0dXJuOworCXJldHVybiAwOwogCiBu
bGFfcHV0X2ZhaWx1cmU6CiAJbmxtc2dfZnJlZShza2IpOwogZmFpbGVkOgogCWRyYmRfZXJyKGNv
bm5lY3Rpb24sICJFcnJvciAlZCB3aGlsZSBicm9hZGNhc3RpbmcgZXZlbnQuIEV2ZW50IHNlcTol
dVxuIiwKIAkJIGVyciwgc2VxKTsKKwlyZXR1cm4gZXJyOwogfQogCi12b2lkIG5vdGlmeV9wZWVy
X2RldmljZV9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAoraW50IG5vdGlmeV9wZWVyX2Rldmlj
ZV9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCQkJICAgICAgdW5zaWduZWQgaW50IHNlcSwK
IAkJCSAgICAgIHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwKIAkJCSAgICAg
IHN0cnVjdCBwZWVyX2RldmljZV9pbmZvICpwZWVyX2RldmljZV9pbmZvLApAQCAtNDczOSwxMyAr
NDc0MiwxNCBAQCB2b2lkIG5vdGlmeV9wZWVyX2RldmljZV9zdGF0ZShzdHJ1Y3Qgc2tfYnVmZiAq
c2tiLAogCQlpZiAoZXJyICYmIGVyciAhPSAtRVNSQ0gpCiAJCQlnb3RvIGZhaWxlZDsKIAl9Ci0J
cmV0dXJuOworCXJldHVybiAwOwogCiBubGFfcHV0X2ZhaWx1cmU6CiAJbmxtc2dfZnJlZShza2Ip
OwogZmFpbGVkOgogCWRyYmRfZXJyKHBlZXJfZGV2aWNlLCAiRXJyb3IgJWQgd2hpbGUgYnJvYWRj
YXN0aW5nIGV2ZW50LiBFdmVudCBzZXE6JXVcbiIsCiAJCSBlcnIsIHNlcSk7CisJcmV0dXJuIGVy
cjsKIH0KIAogdm9pZCBub3RpZnlfaGVscGVyKGVudW0gZHJiZF9ub3RpZmljYXRpb25fdHlwZSB0
eXBlLApAQCAtNDc5Niw3ICs0ODAwLDcgQEAgdm9pZCBub3RpZnlfaGVscGVyKGVudW0gZHJiZF9u
b3RpZmljYXRpb25fdHlwZSB0eXBlLAogCQkgZXJyLCBzZXEpOwogfQogCi1zdGF0aWMgdm9pZCBu
b3RpZnlfaW5pdGlhbF9zdGF0ZV9kb25lKHN0cnVjdCBza19idWZmICpza2IsIHVuc2lnbmVkIGlu
dCBzZXEpCitzdGF0aWMgaW50IG5vdGlmeV9pbml0aWFsX3N0YXRlX2RvbmUoc3RydWN0IHNrX2J1
ZmYgKnNrYiwgdW5zaWduZWQgaW50IHNlcSkKIHsKIAlzdHJ1Y3QgZHJiZF9nZW5sbXNnaGRyICpk
aDsKIAlpbnQgZXJyOwpAQCAtNDgxMCwxMSArNDgxNCwxMiBAQCBzdGF0aWMgdm9pZCBub3RpZnlf
aW5pdGlhbF9zdGF0ZV9kb25lKHN0cnVjdCBza19idWZmICpza2IsIHVuc2lnbmVkIGludCBzZXEp
CiAJaWYgKG5sYV9wdXRfbm90aWZpY2F0aW9uX2hlYWRlcihza2IsIE5PVElGWV9FWElTVFMpKQog
CQlnb3RvIG5sYV9wdXRfZmFpbHVyZTsKIAlnZW5sbXNnX2VuZChza2IsIGRoKTsKLQlyZXR1cm47
CisJcmV0dXJuIDA7CiAKIG5sYV9wdXRfZmFpbHVyZToKIAlubG1zZ19mcmVlKHNrYik7CiAJcHJf
ZXJyKCJFcnJvciAlZCBzZW5kaW5nIGV2ZW50LiBFdmVudCBzZXE6JXVcbiIsIGVyciwgc2VxKTsK
KwlyZXR1cm4gZXJyOwogfQogCiBzdGF0aWMgdm9pZCBmcmVlX3N0YXRlX2NoYW5nZXMoc3RydWN0
IGxpc3RfaGVhZCAqbGlzdCkKQEAgLTQ4NDEsNiArNDg0Niw3IEBAIHN0YXRpYyBpbnQgZ2V0X2lu
aXRpYWxfc3RhdGUoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IG5ldGxpbmtfY2FsbGJhY2sg
KmNiKQogCXVuc2lnbmVkIGludCBzZXEgPSBjYi0+YXJnc1syXTsKIAl1bnNpZ25lZCBpbnQgbjsK
IAllbnVtIGRyYmRfbm90aWZpY2F0aW9uX3R5cGUgZmxhZ3MgPSAwOworCWludCBlcnIgPSAwOwog
CiAJLyogVGhlcmUgaXMgbm8gbmVlZCBmb3IgdGFraW5nIG5vdGlmaWNhdGlvbl9tdXRleCBoZXJl
OiBpdCBkb2Vzbid0CiAJICAgbWF0dGVyIGlmIHRoZSBpbml0aWFsIHN0YXRlIGV2ZW50cyBtaXgg
d2l0aCBsYXRlciBzdGF0ZSBjaGFnZQpAQCAtNDg0OSwzMiArNDg1NSwzMiBAQCBzdGF0aWMgaW50
IGdldF9pbml0aWFsX3N0YXRlKHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRsaW5rX2Nh
bGxiYWNrICpjYikKIAogCWNiLT5hcmdzWzVdLS07CiAJaWYgKGNiLT5hcmdzWzVdID09IDEpIHsK
LQkJbm90aWZ5X2luaXRpYWxfc3RhdGVfZG9uZShza2IsIHNlcSk7CisJCWVyciA9IG5vdGlmeV9p
bml0aWFsX3N0YXRlX2RvbmUoc2tiLCBzZXEpOwogCQlnb3RvIG91dDsKIAl9CiAJbiA9IGNiLT5h
cmdzWzRdKys7CiAJaWYgKGNiLT5hcmdzWzRdIDwgY2ItPmFyZ3NbM10pCiAJCWZsYWdzIHw9IE5P
VElGWV9DT05USU5VRVM7CiAJaWYgKG4gPCAxKSB7Ci0JCW5vdGlmeV9yZXNvdXJjZV9zdGF0ZV9j
aGFuZ2Uoc2tiLCBzZXEsIHN0YXRlX2NoYW5nZS0+cmVzb3VyY2UsCisJCWVyciA9IG5vdGlmeV9y
ZXNvdXJjZV9zdGF0ZV9jaGFuZ2Uoc2tiLCBzZXEsIHN0YXRlX2NoYW5nZS0+cmVzb3VyY2UsCiAJ
CQkJCSAgICAgTk9USUZZX0VYSVNUUyB8IGZsYWdzKTsKIAkJZ290byBuZXh0OwogCX0KIAluLS07
CiAJaWYgKG4gPCBzdGF0ZV9jaGFuZ2UtPm5fY29ubmVjdGlvbnMpIHsKLQkJbm90aWZ5X2Nvbm5l
Y3Rpb25fc3RhdGVfY2hhbmdlKHNrYiwgc2VxLCAmc3RhdGVfY2hhbmdlLT5jb25uZWN0aW9uc1tu
XSwKKwkJZXJyID0gbm90aWZ5X2Nvbm5lY3Rpb25fc3RhdGVfY2hhbmdlKHNrYiwgc2VxLCAmc3Rh
dGVfY2hhbmdlLT5jb25uZWN0aW9uc1tuXSwKIAkJCQkJICAgICAgIE5PVElGWV9FWElTVFMgfCBm
bGFncyk7CiAJCWdvdG8gbmV4dDsKIAl9CiAJbiAtPSBzdGF0ZV9jaGFuZ2UtPm5fY29ubmVjdGlv
bnM7CiAJaWYgKG4gPCBzdGF0ZV9jaGFuZ2UtPm5fZGV2aWNlcykgewotCQlub3RpZnlfZGV2aWNl
X3N0YXRlX2NoYW5nZShza2IsIHNlcSwgJnN0YXRlX2NoYW5nZS0+ZGV2aWNlc1tuXSwKKwkJZXJy
ID0gbm90aWZ5X2RldmljZV9zdGF0ZV9jaGFuZ2Uoc2tiLCBzZXEsICZzdGF0ZV9jaGFuZ2UtPmRl
dmljZXNbbl0sCiAJCQkJCSAgIE5PVElGWV9FWElTVFMgfCBmbGFncyk7CiAJCWdvdG8gbmV4dDsK
IAl9CiAJbiAtPSBzdGF0ZV9jaGFuZ2UtPm5fZGV2aWNlczsKIAlpZiAobiA8IHN0YXRlX2NoYW5n
ZS0+bl9kZXZpY2VzICogc3RhdGVfY2hhbmdlLT5uX2Nvbm5lY3Rpb25zKSB7Ci0JCW5vdGlmeV9w
ZWVyX2RldmljZV9zdGF0ZV9jaGFuZ2Uoc2tiLCBzZXEsICZzdGF0ZV9jaGFuZ2UtPnBlZXJfZGV2
aWNlc1tuXSwKKwkJZXJyID0gbm90aWZ5X3BlZXJfZGV2aWNlX3N0YXRlX2NoYW5nZShza2IsIHNl
cSwgJnN0YXRlX2NoYW5nZS0+cGVlcl9kZXZpY2VzW25dLAogCQkJCQkJTk9USUZZX0VYSVNUUyB8
IGZsYWdzKTsKIAkJZ290byBuZXh0OwogCX0KQEAgLTQ4ODksNyArNDg5NSwxMCBAQCBzdGF0aWMg
aW50IGdldF9pbml0aWFsX3N0YXRlKHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBuZXRsaW5r
X2NhbGxiYWNrICpjYikKIAkJY2ItPmFyZ3NbNF0gPSAwOwogCX0KIG91dDoKLQlyZXR1cm4gc2ti
LT5sZW47CisJaWYgKGVycikKKwkJcmV0dXJuIGVycjsKKwllbHNlCisJCXJldHVybiBza2ItPmxl
bjsKIH0KIAogaW50IGRyYmRfYWRtX2dldF9pbml0aWFsX3N0YXRlKHN0cnVjdCBza19idWZmICpz
a2IsIHN0cnVjdCBuZXRsaW5rX2NhbGxiYWNrICpjYikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxv
Y2svZHJiZC9kcmJkX3N0YXRlLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZS5jCmlu
ZGV4IGI4YTI3ODE4YWIzZi4uNGVlMTFhZWY2NjcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9zdGF0ZS5jCisrKyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3N0YXRlLmMK
QEAgLTE1MzcsNyArMTUzNyw3IEBAIGludCBkcmJkX2JpdG1hcF9pb19mcm9tX3dvcmtlcihzdHJ1
Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwKIAlyZXR1cm4gcnY7CiB9CiAKLXZvaWQgbm90aWZ5X3Jl
c291cmNlX3N0YXRlX2NoYW5nZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAoraW50IG5vdGlmeV9yZXNv
dXJjZV9zdGF0ZV9jaGFuZ2Uoc3RydWN0IHNrX2J1ZmYgKnNrYiwKIAkJCQkgIHVuc2lnbmVkIGlu
dCBzZXEsCiAJCQkJICBzdHJ1Y3QgZHJiZF9yZXNvdXJjZV9zdGF0ZV9jaGFuZ2UgKnJlc291cmNl
X3N0YXRlX2NoYW5nZSwKIAkJCQkgIGVudW0gZHJiZF9ub3RpZmljYXRpb25fdHlwZSB0eXBlKQpA
QCAtMTU1MCwxMCArMTU1MCwxMCBAQCB2b2lkIG5vdGlmeV9yZXNvdXJjZV9zdGF0ZV9jaGFuZ2Uo
c3RydWN0IHNrX2J1ZmYgKnNrYiwKIAkJLnJlc19zdXNwX2ZlbiA9IHJlc291cmNlX3N0YXRlX2No
YW5nZS0+c3VzcF9mZW5bTkVXXSwKIAl9OwogCi0Jbm90aWZ5X3Jlc291cmNlX3N0YXRlKHNrYiwg
c2VxLCByZXNvdXJjZSwgJnJlc291cmNlX2luZm8sIHR5cGUpOworCXJldHVybiBub3RpZnlfcmVz
b3VyY2Vfc3RhdGUoc2tiLCBzZXEsIHJlc291cmNlLCAmcmVzb3VyY2VfaW5mbywgdHlwZSk7CiB9
CiAKLXZvaWQgbm90aWZ5X2Nvbm5lY3Rpb25fc3RhdGVfY2hhbmdlKHN0cnVjdCBza19idWZmICpz
a2IsCitpbnQgbm90aWZ5X2Nvbm5lY3Rpb25fc3RhdGVfY2hhbmdlKHN0cnVjdCBza19idWZmICpz
a2IsCiAJCQkJICAgIHVuc2lnbmVkIGludCBzZXEsCiAJCQkJICAgIHN0cnVjdCBkcmJkX2Nvbm5l
Y3Rpb25fc3RhdGVfY2hhbmdlICpjb25uZWN0aW9uX3N0YXRlX2NoYW5nZSwKIAkJCQkgICAgZW51
bSBkcmJkX25vdGlmaWNhdGlvbl90eXBlIHR5cGUpCkBAIC0xNTY0LDEwICsxNTY0LDEwIEBAIHZv
aWQgbm90aWZ5X2Nvbm5lY3Rpb25fc3RhdGVfY2hhbmdlKHN0cnVjdCBza19idWZmICpza2IsCiAJ
CS5jb25uX3JvbGUgPSBjb25uZWN0aW9uX3N0YXRlX2NoYW5nZS0+cGVlcl9yb2xlW05FV10sCiAJ
fTsKIAotCW5vdGlmeV9jb25uZWN0aW9uX3N0YXRlKHNrYiwgc2VxLCBjb25uZWN0aW9uLCAmY29u
bmVjdGlvbl9pbmZvLCB0eXBlKTsKKwlyZXR1cm4gbm90aWZ5X2Nvbm5lY3Rpb25fc3RhdGUoc2ti
LCBzZXEsIGNvbm5lY3Rpb24sICZjb25uZWN0aW9uX2luZm8sIHR5cGUpOwogfQogCi12b2lkIG5v
dGlmeV9kZXZpY2Vfc3RhdGVfY2hhbmdlKHN0cnVjdCBza19idWZmICpza2IsCitpbnQgbm90aWZ5
X2RldmljZV9zdGF0ZV9jaGFuZ2Uoc3RydWN0IHNrX2J1ZmYgKnNrYiwKIAkJCQl1bnNpZ25lZCBp
bnQgc2VxLAogCQkJCXN0cnVjdCBkcmJkX2RldmljZV9zdGF0ZV9jaGFuZ2UgKmRldmljZV9zdGF0
ZV9jaGFuZ2UsCiAJCQkJZW51bSBkcmJkX25vdGlmaWNhdGlvbl90eXBlIHR5cGUpCkBAIC0xNTc3
LDEwICsxNTc3LDEwIEBAIHZvaWQgbm90aWZ5X2RldmljZV9zdGF0ZV9jaGFuZ2Uoc3RydWN0IHNr
X2J1ZmYgKnNrYiwKIAkJLmRldl9kaXNrX3N0YXRlID0gZGV2aWNlX3N0YXRlX2NoYW5nZS0+ZGlz
a19zdGF0ZVtORVddLAogCX07CiAKLQlub3RpZnlfZGV2aWNlX3N0YXRlKHNrYiwgc2VxLCBkZXZp
Y2UsICZkZXZpY2VfaW5mbywgdHlwZSk7CisJcmV0dXJuIG5vdGlmeV9kZXZpY2Vfc3RhdGUoc2ti
LCBzZXEsIGRldmljZSwgJmRldmljZV9pbmZvLCB0eXBlKTsKIH0KIAotdm9pZCBub3RpZnlfcGVl
cl9kZXZpY2Vfc3RhdGVfY2hhbmdlKHN0cnVjdCBza19idWZmICpza2IsCitpbnQgbm90aWZ5X3Bl
ZXJfZGV2aWNlX3N0YXRlX2NoYW5nZShzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCQkJCSAgICAgdW5z
aWduZWQgaW50IHNlcSwKIAkJCQkgICAgIHN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlX3N0YXRlX2No
YW5nZSAqcCwKIAkJCQkgICAgIGVudW0gZHJiZF9ub3RpZmljYXRpb25fdHlwZSB0eXBlKQpAQCAt
MTU5NCw3ICsxNTk0LDcgQEAgdm9pZCBub3RpZnlfcGVlcl9kZXZpY2Vfc3RhdGVfY2hhbmdlKHN0
cnVjdCBza19idWZmICpza2IsCiAJCS5wZWVyX3Jlc3luY19zdXNwX2RlcGVuZGVuY3kgPSBwLT5y
ZXN5bmNfc3VzcF9kZXBlbmRlbmN5W05FV10sCiAJfTsKIAotCW5vdGlmeV9wZWVyX2RldmljZV9z
dGF0ZShza2IsIHNlcSwgcGVlcl9kZXZpY2UsICZwZWVyX2RldmljZV9pbmZvLCB0eXBlKTsKKwly
ZXR1cm4gbm90aWZ5X3BlZXJfZGV2aWNlX3N0YXRlKHNrYiwgc2VxLCBwZWVyX2RldmljZSwgJnBl
ZXJfZGV2aWNlX2luZm8sIHR5cGUpOwogfQogCiBzdGF0aWMgdm9pZCBicm9hZGNhc3Rfc3RhdGVf
Y2hhbmdlKHN0cnVjdCBkcmJkX3N0YXRlX2NoYW5nZSAqc3RhdGVfY2hhbmdlKQpAQCAtMTYwMiw3
ICsxNjAyLDcgQEAgc3RhdGljIHZvaWQgYnJvYWRjYXN0X3N0YXRlX2NoYW5nZShzdHJ1Y3QgZHJi
ZF9zdGF0ZV9jaGFuZ2UgKnN0YXRlX2NoYW5nZSkKIAlzdHJ1Y3QgZHJiZF9yZXNvdXJjZV9zdGF0
ZV9jaGFuZ2UgKnJlc291cmNlX3N0YXRlX2NoYW5nZSA9ICZzdGF0ZV9jaGFuZ2UtPnJlc291cmNl
WzBdOwogCWJvb2wgcmVzb3VyY2Vfc3RhdGVfaGFzX2NoYW5nZWQ7CiAJdW5zaWduZWQgaW50IG5f
ZGV2aWNlLCBuX2Nvbm5lY3Rpb24sIG5fcGVlcl9kZXZpY2UsIG5fcGVlcl9kZXZpY2VzOwotCXZv
aWQgKCpsYXN0X2Z1bmMpKHN0cnVjdCBza19idWZmICosIHVuc2lnbmVkIGludCwgdm9pZCAqLAor
CWludCAoKmxhc3RfZnVuYykoc3RydWN0IHNrX2J1ZmYgKiwgdW5zaWduZWQgaW50LCB2b2lkICos
CiAJCQkgIGVudW0gZHJiZF9ub3RpZmljYXRpb25fdHlwZSkgPSBOVUxMOwogCXZvaWQgKmxhc3Rf
YXJnID0gTlVMTDsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGVf
Y2hhbmdlLmggYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9zdGF0ZV9jaGFuZ2UuaAppbmRleCBi
YTgwZjYxMmQ2YWIuLmQ1YjA0NzliYzlhNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJk
L2RyYmRfc3RhdGVfY2hhbmdlLmgKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfc3RhdGVf
Y2hhbmdlLmgKQEAgLTQ0LDE5ICs0NCwxOSBAQCBleHRlcm4gc3RydWN0IGRyYmRfc3RhdGVfY2hh
bmdlICpyZW1lbWJlcl9vbGRfc3RhdGUoc3RydWN0IGRyYmRfcmVzb3VyY2UgKiwgZ2ZwXwogZXh0
ZXJuIHZvaWQgY29weV9vbGRfdG9fbmV3X3N0YXRlX2NoYW5nZShzdHJ1Y3QgZHJiZF9zdGF0ZV9j
aGFuZ2UgKik7CiBleHRlcm4gdm9pZCBmb3JnZXRfc3RhdGVfY2hhbmdlKHN0cnVjdCBkcmJkX3N0
YXRlX2NoYW5nZSAqKTsKIAotZXh0ZXJuIHZvaWQgbm90aWZ5X3Jlc291cmNlX3N0YXRlX2NoYW5n
ZShzdHJ1Y3Qgc2tfYnVmZiAqLAorZXh0ZXJuIGludCBub3RpZnlfcmVzb3VyY2Vfc3RhdGVfY2hh
bmdlKHN0cnVjdCBza19idWZmICosCiAJCQkJCSB1bnNpZ25lZCBpbnQsCiAJCQkJCSBzdHJ1Y3Qg
ZHJiZF9yZXNvdXJjZV9zdGF0ZV9jaGFuZ2UgKiwKIAkJCQkJIGVudW0gZHJiZF9ub3RpZmljYXRp
b25fdHlwZSB0eXBlKTsKLWV4dGVybiB2b2lkIG5vdGlmeV9jb25uZWN0aW9uX3N0YXRlX2NoYW5n
ZShzdHJ1Y3Qgc2tfYnVmZiAqLAorZXh0ZXJuIGludCBub3RpZnlfY29ubmVjdGlvbl9zdGF0ZV9j
aGFuZ2Uoc3RydWN0IHNrX2J1ZmYgKiwKIAkJCQkJICAgdW5zaWduZWQgaW50LAogCQkJCQkgICBz
dHJ1Y3QgZHJiZF9jb25uZWN0aW9uX3N0YXRlX2NoYW5nZSAqLAogCQkJCQkgICBlbnVtIGRyYmRf
bm90aWZpY2F0aW9uX3R5cGUgdHlwZSk7Ci1leHRlcm4gdm9pZCBub3RpZnlfZGV2aWNlX3N0YXRl
X2NoYW5nZShzdHJ1Y3Qgc2tfYnVmZiAqLAorZXh0ZXJuIGludCBub3RpZnlfZGV2aWNlX3N0YXRl
X2NoYW5nZShzdHJ1Y3Qgc2tfYnVmZiAqLAogCQkJCSAgICAgICB1bnNpZ25lZCBpbnQsCiAJCQkJ
ICAgICAgIHN0cnVjdCBkcmJkX2RldmljZV9zdGF0ZV9jaGFuZ2UgKiwKIAkJCQkgICAgICAgZW51
bSBkcmJkX25vdGlmaWNhdGlvbl90eXBlIHR5cGUpOwotZXh0ZXJuIHZvaWQgbm90aWZ5X3BlZXJf
ZGV2aWNlX3N0YXRlX2NoYW5nZShzdHJ1Y3Qgc2tfYnVmZiAqLAorZXh0ZXJuIGludCBub3RpZnlf
cGVlcl9kZXZpY2Vfc3RhdGVfY2hhbmdlKHN0cnVjdCBza19idWZmICosCiAJCQkJCSAgICB1bnNp
Z25lZCBpbnQsCiAJCQkJCSAgICBzdHJ1Y3QgZHJiZF9wZWVyX2RldmljZV9zdGF0ZV9jaGFuZ2Ug
KiwKIAkJCQkJICAgIGVudW0gZHJiZF9ub3RpZmljYXRpb25fdHlwZSB0eXBlKTsKLS0gCjIuMzUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1k
ZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5s
aW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
