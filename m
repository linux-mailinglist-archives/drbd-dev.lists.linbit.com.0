Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 02958622C86
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Nov 2022 14:36:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2A75422114;
	Wed,  9 Nov 2022 14:36:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2D3F342210F
	for <drbd-dev@lists.linbit.com>; Wed,  9 Nov 2022 14:35:13 +0100 (CET)
Received: by mail-ej1-f43.google.com with SMTP id ft34so10328196ejc.12
	for <drbd-dev@lists.linbit.com>; Wed, 09 Nov 2022 05:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=iWe+5u2rhx99ZPm+uxu8vcq2qF8FxcNBmLJ9xXsjgYQ=;
	b=AP13A9WkHMJ3O7/MGQkFOlZ4M+10TdavqFR7l74hQmBAVZOOW8N6Mqnj/k7kFxQKO1
	rGT4cTRGDd8SMjF2r88N5vuz2URbYnEWqdtHWR82wv4pVyFDaCpZrY2HtjeS3HY07vux
	SkJaQEB2UA282vynElxl49j/7VVm4kNRQGkXry1INd9vjamQf75RCf636JW+dO5GkRS9
	/GetEte/TyLenuoRg8zOXImlFlF0VjNbrS0Qt2fWDEgu6YSBIxOI7m4fHheNI98x1YH0
	8eAoXuII2ysyIjh9S11RHvJoiLPipAsg4qCpN55wB2lWPwtpfidWkIOoRfXv/syXONBX
	PqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=iWe+5u2rhx99ZPm+uxu8vcq2qF8FxcNBmLJ9xXsjgYQ=;
	b=bCKR/9GIC6cAGvh8sjptovplwlwROe9F0JpbRK2WB+N4gMw+vMHJ4drYKb6VZCA++Q
	0FWR8A1Kr7ILfSOaveEHyO35VsjMa/yBZCOlaqOy5JG24t0dLU23ob+xaBbozAm2us2R
	NKefoNna2KQGsC00DUvUAYqQvVt+kZrM3wyZBx+zl64bZg423Zdwa2LbxIR99WUGXw2X
	XH7qdlK4cHRuEucD85H5Z8JIuD1Tj0dDFwm5kx2+5p7hYW/OijCuSAMcGZGROp9tP3DF
	lwvuY23uwc06kiJVisJIZ3DfvPoUkv29/7O6HrLdk8b/w3+R7Bms8FNEy+Ezn3pSGKKb
	ZMTQ==
X-Gm-Message-State: ACrzQf0heqYSmm80TH3tv7iJktx1s9dNcpQCzcI98AJdAd9f15188r+/
	RSkmIV5SF8SFDW1bypJEV8ScH0YU
X-Google-Smtp-Source: AMsMyM6a65RzbbqC+srmccd6E9Gov22R/kBAsfCAbzVLYA/p7/msjAYJOuVcjWQexrDO+QtB+ef9yA==
X-Received: by 2002:a17:907:60c8:b0:78d:bc8d:8457 with SMTP id
	hv8-20020a17090760c800b0078dbc8d8457mr55342620ejc.418.1668000913542;
	Wed, 09 Nov 2022 05:35:13 -0800 (PST)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	lx8-20020a170906af0800b00782fbb7f5f7sm5867463ejb.113.2022.11.09.05.35.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Nov 2022 05:35:13 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  9 Nov 2022 14:34:53 +0100
Message-Id: <20221109133453.51652-4-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
References: <20221109133453.51652-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH RESEND 3/3] drbd: Store op in drbd_peer_request
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

KFNvcnQgb2YpIGNoZXJyeS1waWNrZWQgZnJvbSB0aGUgb3V0LW9mLXRyZWUgZHJiZDkgYnJhbmNo
LiBPcmlnaW5hbApjb21taXQgbWVzc2FnZSBieSBKb2VsIENvbGxlZGdlOgoKICAgIFRoaXMgc2lt
cGxpZmllcyBkcmJkX3N1Ym1pdF9wZWVyX3JlcXVlc3QgYnkgcmVtb3ZpbmcgbW9zdCBvZiB0aGUK
ICAgIGFyZ3VtZW50cy4gSXQgYWxzbyBtYWtlcyB0aGUgdHJlYXRtZW50IG9mIHRoZSBvcCBiZXR0
ZXIgYWxpZ25lZCB3aXRoCiAgICB0aGF0IGluIHN0cnVjdCBiaW8uCgogICAgRGV0ZXJtaW5lIGZh
dWx0X3R5cGUgZHluYW1pY2FsbHkgdXNpbmcgaW5mb3JtYXRpb24gd2hpY2ggaXMgYWxyZWFkeQog
ICAgYXZhaWxhYmxlIGluc3RlYWQgb2YgcGFzc2luZyBpdCBpbiBhcyBhIHBhcmFtZXRlci4KCk5v
dGU6IFRoZSBvcGYgaW4gcmVjZWl2ZV9yc19kZWFsbG9jYXRlZCB3YXMgY2hhbmdlZCBmcm9tClJF
UV9PUF9XUklURV9aRVJPRVMgdG8gUkVRX09QX0RJU0NBUkQuIFRoaXMgd2FzIHJlcXVpcmVkIGlu
IHRoZQpvdXQtb2YtdHJlZSBtb2R1bGUsIGFuZCBkb2VzIG5vdCBtYXR0ZXIgaW4tdHJlZS4gVGhl
IG9wZiBpcyBpZ25vcmVkCmFueXdheSBpbiBkcmJkX3N1Ym1pdF9wZWVyX3JlcXVlc3QsIHNpbmNl
IHRoZSBkaXNjYXJkL3plcm8tb3V0IGlzCmRlY2lkZWQgYnkgdGhlIEVFX1RSSU0gZmxhZy4KClNp
Z25lZC1vZmYtYnk6IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJA
bGluYml0LmNvbT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCAgICAgIHwgIDgg
KystCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9yZWNlaXZlci5jIHwgODEgKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF93b3JrZXIuYyAgIHwg
IDQgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmggYi9kcml2ZXJzL2Js
b2NrL2RyYmQvZHJiZF9pbnQuaAppbmRleCA0ZDY2MTI4MmZmNDEuLjkxM2NmNGM1NWNiYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKKysrIGIvZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfaW50LmgKQEAgLTM5NSw2ICszOTUsNyBAQCBzdHJ1Y3QgZHJiZF9wZWVyX3Jl
cXVlc3QgewogCXN0cnVjdCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZTsKIAlzdHJ1Y3Qg
ZHJiZF9lcG9jaCAqZXBvY2g7IC8qIGZvciB3cml0ZXMgKi8KIAlzdHJ1Y3QgcGFnZSAqcGFnZXM7
CisJYmxrX29wZl90IG9wZjsKIAlhdG9taWNfdCBwZW5kaW5nX2Jpb3M7CiAJc3RydWN0IGRyYmRf
aW50ZXJ2YWwgaTsKIAkvKiBzZWUgY29tbWVudHMgb24gZWUgZmxhZyBiaXRzIGJlbG93ICovCkBA
IC00MDYsNiArNDA3LDEwIEBAIHN0cnVjdCBkcmJkX3BlZXJfcmVxdWVzdCB7CiAJfTsKIH07CiAK
Ky8qIEVxdWl2YWxlbnQgdG8gYmlvX29wIGFuZCByZXFfb3AuICovCisjZGVmaW5lIHBlZXJfcmVx
X29wKHBlZXJfcmVxKSBcCisJKChwZWVyX3JlcSktPm9wZiAmIFJFUV9PUF9NQVNLKQorCiAvKiBl
ZSBmbGFnIGJpdHMuCiAgKiBXaGlsZSBjb3JyZXNwb25kaW5nIGJpb3MgYXJlIGluIGZsaWdodCwg
dGhlIG9ubHkgbW9kaWZpY2F0aW9uIHdpbGwgYmUKICAqIHNldF9iaXQgV0FTX0VSUk9SLCB3aGlj
aCBoYXMgdG8gYmUgYXRvbWljLgpAQCAtMTU0NSw4ICsxNTUwLDcgQEAgZXh0ZXJuIHZvaWQgZHJi
ZF9zZW5kX2Fja3Nfd2Yoc3RydWN0IHdvcmtfc3RydWN0ICp3cyk7CiBleHRlcm4gYm9vbCBkcmJk
X3JzX2NfbWluX3JhdGVfdGhyb3R0bGUoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UpOwogZXh0
ZXJuIGJvb2wgZHJiZF9yc19zaG91bGRfc2xvd19kb3duKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2
aWNlLCBzZWN0b3JfdCBzZWN0b3IsCiAJCWJvb2wgdGhyb3R0bGVfaWZfYXBwX2lzX3dhaXRpbmcp
OwotZXh0ZXJuIGludCBkcmJkX3N1Ym1pdF9wZWVyX3JlcXVlc3Qoc3RydWN0IGRyYmRfZGV2aWNl
ICosCi0JCQkJICAgIHN0cnVjdCBkcmJkX3BlZXJfcmVxdWVzdCAqLCBibGtfb3BmX3QsIGludCk7
CitleHRlcm4gaW50IGRyYmRfc3VibWl0X3BlZXJfcmVxdWVzdChzdHJ1Y3QgZHJiZF9wZWVyX3Jl
cXVlc3QgKnBlZXJfcmVxKTsKIGV4dGVybiBpbnQgZHJiZF9mcmVlX3BlZXJfcmVxcyhzdHJ1Y3Qg
ZHJiZF9kZXZpY2UgKiwgc3RydWN0IGxpc3RfaGVhZCAqKTsKIGV4dGVybiBzdHJ1Y3QgZHJiZF9w
ZWVyX3JlcXVlc3QgKmRyYmRfYWxsb2NfcGVlcl9yZXEoc3RydWN0IGRyYmRfcGVlcl9kZXZpY2Ug
KiwgdTY0LAogCQkJCQkJICAgICBzZWN0b3JfdCwgdW5zaWduZWQgaW50LApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9k
cmJkX3JlY2VpdmVyLmMKaW5kZXggZWU2OWQ1MGJhNGZkLi45M2Q2ZGY0ZGM1YTQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3JlY2VpdmVyLmMKKysrIGIvZHJpdmVycy9ibG9j
ay9kcmJkL2RyYmRfcmVjZWl2ZXIuYwpAQCAtMTYwMyw5ICsxNjAzLDE5IEBAIHN0YXRpYyB2b2lk
IGRyYmRfaXNzdWVfcGVlcl9kaXNjYXJkX29yX3plcm9fb3V0KHN0cnVjdCBkcmJkX2RldmljZSAq
ZGV2aWNlLCBzdHJ1CiAJZHJiZF9lbmRpb193cml0ZV9zZWNfZmluYWwocGVlcl9yZXEpOwogfQog
CitzdGF0aWMgaW50IHBlZXJfcmVxdWVzdF9mYXVsdF90eXBlKHN0cnVjdCBkcmJkX3BlZXJfcmVx
dWVzdCAqcGVlcl9yZXEpCit7CisJaWYgKHBlZXJfcmVxX29wKHBlZXJfcmVxKSA9PSBSRVFfT1Bf
UkVBRCkgeworCQlyZXR1cm4gcGVlcl9yZXEtPmZsYWdzICYgRUVfQVBQTElDQVRJT04gPworCQkJ
RFJCRF9GQVVMVF9EVF9SRCA6IERSQkRfRkFVTFRfUlNfUkQ7CisJfSBlbHNlIHsKKwkJcmV0dXJu
IHBlZXJfcmVxLT5mbGFncyAmIEVFX0FQUExJQ0FUSU9OID8KKwkJCURSQkRfRkFVTFRfRFRfV1Ig
OiBEUkJEX0ZBVUxUX1JTX1dSOworCX0KK30KKwogLyoqCiAgKiBkcmJkX3N1Ym1pdF9wZWVyX3Jl
cXVlc3QoKQotICogQGRldmljZToJRFJCRCBkZXZpY2UuCiAgKiBAcGVlcl9yZXE6CXBlZXIgcmVx
dWVzdAogICoKICAqIE1heSBzcHJlYWQgdGhlIHBhZ2VzIHRvIG11bHRpcGxlIGJpb3MsCkBAIC0x
NjE5LDEwICsxNjI5LDkgQEAgc3RhdGljIHZvaWQgZHJiZF9pc3N1ZV9wZWVyX2Rpc2NhcmRfb3Jf
emVyb19vdXQoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHN0cnUKICAqICBvbiBjZXJ0YWlu
IFhlbiBkZXBsb3ltZW50cy4KICAqLwogLyogVE9ETyBhbGxvY2F0ZSBmcm9tIG91ciBvd24gYmlv
X3NldC4gKi8KLWludCBkcmJkX3N1Ym1pdF9wZWVyX3JlcXVlc3Qoc3RydWN0IGRyYmRfZGV2aWNl
ICpkZXZpY2UsCi0JCQkgICAgIHN0cnVjdCBkcmJkX3BlZXJfcmVxdWVzdCAqcGVlcl9yZXEsCi0J
CQkgICAgIGNvbnN0IGJsa19vcGZfdCBvcGYsIGNvbnN0IGludCBmYXVsdF90eXBlKQoraW50IGRy
YmRfc3VibWl0X3BlZXJfcmVxdWVzdChzdHJ1Y3QgZHJiZF9wZWVyX3JlcXVlc3QgKnBlZXJfcmVx
KQogeworCXN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlID0gcGVlcl9yZXEtPnBlZXJfZGV2aWNl
LT5kZXZpY2U7CiAJc3RydWN0IGJpbyAqYmlvcyA9IE5VTEw7CiAJc3RydWN0IGJpbyAqYmlvOwog
CXN0cnVjdCBwYWdlICpwYWdlID0gcGVlcl9yZXEtPnBhZ2VzOwpAQCAtMTY2Nyw3ICsxNjc2LDE4
IEBAIGludCBkcmJkX3N1Ym1pdF9wZWVyX3JlcXVlc3Qoc3RydWN0IGRyYmRfZGV2aWNlICpkZXZp
Y2UsCiAJICogZ2VuZXJhdGVkIGJpbywgYnV0IGEgYmlvIGFsbG9jYXRlZCBvbiBiZWhhbGYgb2Yg
dGhlIHBlZXIuCiAJICovCiBuZXh0X2JpbzoKLQliaW8gPSBiaW9fYWxsb2MoZGV2aWNlLT5sZGV2
LT5iYWNraW5nX2JkZXYsIG5yX3BhZ2VzLCBvcGYsIEdGUF9OT0lPKTsKKwkvKiBfRElTQ0FSRCwg
X1dSSVRFX1pFUk9FUyBoYW5kbGVkIGFib3ZlLgorCSAqIFJFUV9PUF9GTFVTSCAoZW1wdHkgZmx1
c2gpIG5vdCBleHBlY3RlZCwKKwkgKiBzaG91bGQgaGF2ZSBiZWVuIG1hcHBlZCB0byBhICJkcmJk
IHByb3RvY29sIGJhcnJpZXIiLgorCSAqIFJFUV9PUF9TRUNVUkVfRVJBU0U6IEkgZG9uJ3Qgc2Vl
IGhvdyB3ZSBjb3VsZCBldmVyIHN1cHBvcnQgdGhhdC4KKwkgKi8KKwlpZiAoIShwZWVyX3JlcV9v
cChwZWVyX3JlcSkgPT0gUkVRX09QX1dSSVRFIHx8CisJCQkJcGVlcl9yZXFfb3AocGVlcl9yZXEp
ID09IFJFUV9PUF9SRUFEKSkgeworCQlkcmJkX2VycihkZXZpY2UsICJJbnZhbGlkIGJpbyBvcCBy
ZWNlaXZlZDogMHgleFxuIiwgcGVlcl9yZXEtPm9wZik7CisJCXJldHVybiAtRUlOVkFMOworCX0K
KworCWJpbyA9IGJpb19hbGxvYyhkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldiwgbnJfcGFnZXMs
IHBlZXJfcmVxLT5vcGYsIEdGUF9OT0lPKTsKIAkvKiA+IHBlZXJfcmVxLT5pLnNlY3RvciwgdW5s
ZXNzIHRoaXMgaXMgdGhlIGZpcnN0IGJpbyAqLwogCWJpby0+YmlfaXRlci5iaV9zZWN0b3IgPSBz
ZWN0b3I7CiAJYmlvLT5iaV9wcml2YXRlID0gcGVlcl9yZXE7CkBAIC0xNjk3LDcgKzE3MTcsNyBA
QCBpbnQgZHJiZF9zdWJtaXRfcGVlcl9yZXF1ZXN0KHN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNl
LAogCQliaW9zID0gYmlvcy0+YmlfbmV4dDsKIAkJYmlvLT5iaV9uZXh0ID0gTlVMTDsKIAotCQlk
cmJkX3N1Ym1pdF9iaW9fbm9hY2N0KGRldmljZSwgZmF1bHRfdHlwZSwgYmlvKTsKKwkJZHJiZF9z
dWJtaXRfYmlvX25vYWNjdChkZXZpY2UsIHBlZXJfcmVxdWVzdF9mYXVsdF90eXBlKHBlZXJfcmVx
KSwgYmlvKTsKIAl9IHdoaWxlIChiaW9zKTsKIAlyZXR1cm4gMDsKIH0KQEAgLTIwNTEsNiArMjA3
MSw3IEBAIHN0YXRpYyBpbnQgcmVjdl9yZXN5bmNfcmVhZChzdHJ1Y3QgZHJiZF9wZWVyX2Rldmlj
ZSAqcGVlcl9kZXZpY2UsIHNlY3Rvcl90IHNlY3RvCiAJICogcmVzcGVjdGl2ZSBfZHJiZF9jbGVh
cl9kb25lX2VlICovCiAKIAlwZWVyX3JlcS0+dy5jYiA9IGVfZW5kX3Jlc3luY19ibG9jazsKKwlw
ZWVyX3JlcS0+b3BmID0gUkVRX09QX1dSSVRFOwogCXBlZXJfcmVxLT5zdWJtaXRfamlmID0gamlm
ZmllczsKIAogCXNwaW5fbG9ja19pcnEoJmRldmljZS0+cmVzb3VyY2UtPnJlcV9sb2NrKTsKQEAg
LTIwNTgsOCArMjA3OSw3IEBAIHN0YXRpYyBpbnQgcmVjdl9yZXN5bmNfcmVhZChzdHJ1Y3QgZHJi
ZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsIHNlY3Rvcl90IHNlY3RvCiAJc3Bpbl91bmxvY2tf
aXJxKCZkZXZpY2UtPnJlc291cmNlLT5yZXFfbG9jayk7CiAKIAlhdG9taWNfYWRkKHBpLT5zaXpl
ID4+IDksICZkZXZpY2UtPnJzX3NlY3RfZXYpOwotCWlmIChkcmJkX3N1Ym1pdF9wZWVyX3JlcXVl
c3QoZGV2aWNlLCBwZWVyX3JlcSwgUkVRX09QX1dSSVRFLAotCQkJCSAgICAgRFJCRF9GQVVMVF9S
U19XUikgPT0gMCkKKwlpZiAoZHJiZF9zdWJtaXRfcGVlcl9yZXF1ZXN0KHBlZXJfcmVxKSA9PSAw
KQogCQlyZXR1cm4gMDsKIAogCS8qIGRvbid0IGNhcmUgZm9yIHRoZSByZWFzb24gaGVyZSAqLwpA
QCAtMjM3NSwxNiArMjM5NSw2IEBAIHN0YXRpYyBpbnQgd2FpdF9mb3JfYW5kX3VwZGF0ZV9wZWVy
X3NlcShzdHJ1Y3QgZHJiZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsIGNvCiAJcmV0dXJuIHJl
dDsKIH0KIAotLyogc2VlIGFsc28gYmlvX2ZsYWdzX3RvX3dpcmUoKQotICogRFJCRF9SRVFfKiwg
YmVjYXVzZSB3ZSBuZWVkIHRvIHNlbWFudGljYWxseSBtYXAgdGhlIGZsYWdzIHRvIGRhdGEgcGFj
a2V0Ci0gKiBmbGFncyBhbmQgYmFjay4gV2UgbWF5IHJlcGxpY2F0ZSB0byBvdGhlciBrZXJuZWwg
dmVyc2lvbnMuICovCi1zdGF0aWMgYmxrX29wZl90IHdpcmVfZmxhZ3NfdG9fYmlvX2ZsYWdzKHUz
MiBkcGYpCi17Ci0JcmV0dXJuICAoZHBmICYgRFBfUldfU1lOQyA/IFJFUV9TWU5DIDogMCkgfAot
CQkoZHBmICYgRFBfRlVBID8gUkVRX0ZVQSA6IDApIHwKLQkJKGRwZiAmIERQX0ZMVVNIID8gUkVR
X1BSRUZMVVNIIDogMCk7Ci19Ci0KIHN0YXRpYyBlbnVtIHJlcV9vcCB3aXJlX2ZsYWdzX3RvX2Jp
b19vcCh1MzIgZHBmKQogewogCWlmIChkcGYgJiBEUF9aRVJPRVMpCkBAIC0yMzk1LDYgKzI0MDUs
MTUgQEAgc3RhdGljIGVudW0gcmVxX29wIHdpcmVfZmxhZ3NfdG9fYmlvX29wKHUzMiBkcGYpCiAJ
CXJldHVybiBSRVFfT1BfV1JJVEU7CiB9CiAKKy8qIHNlZSBhbHNvIGJpb19mbGFnc190b193aXJl
KCkgKi8KK3N0YXRpYyBibGtfb3BmX3Qgd2lyZV9mbGFnc190b19iaW8oc3RydWN0IGRyYmRfY29u
bmVjdGlvbiAqY29ubmVjdGlvbiwgdTMyIGRwZikKK3sKKwlyZXR1cm4gd2lyZV9mbGFnc190b19i
aW9fb3AoZHBmKSB8CisJCShkcGYgJiBEUF9SV19TWU5DID8gUkVRX1NZTkMgOiAwKSB8CisJCShk
cGYgJiBEUF9GVUEgPyBSRVFfRlVBIDogMCkgfAorCQkoZHBmICYgRFBfRkxVU0ggPyBSRVFfUFJF
RkxVU0ggOiAwKTsKK30KKwogc3RhdGljIHZvaWQgZmFpbF9wb3N0cG9uZWRfcmVxdWVzdHMoc3Ry
dWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIHNlY3Rvcl90IHNlY3RvciwKIAkJCQkgICAgdW5zaWdu
ZWQgaW50IHNpemUpCiB7CkBAIC0yNTM4LDggKzI1NTcsNiBAQCBzdGF0aWMgaW50IHJlY2VpdmVf
RGF0YShzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0aW9uLCBzdHJ1Y3QgcGFja2V0X2lu
Zm8gKgogCXN0cnVjdCBkcmJkX3BlZXJfcmVxdWVzdCAqcGVlcl9yZXE7CiAJc3RydWN0IHBfZGF0
YSAqcCA9IHBpLT5kYXRhOwogCXUzMiBwZWVyX3NlcSA9IGJlMzJfdG9fY3B1KHAtPnNlcV9udW0p
OwotCWVudW0gcmVxX29wIG9wOwotCWJsa19vcGZfdCBvcF9mbGFnczsKIAl1MzIgZHBfZmxhZ3M7
CiAJaW50IGVyciwgdHA7CiAKQEAgLTI1NzgsMTEgKzI1OTUsMTAgQEAgc3RhdGljIGludCByZWNl
aXZlX0RhdGEoc3RydWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVjdGlvbiwgc3RydWN0IHBhY2tl
dF9pbmZvICoKIAlwZWVyX3JlcS0+ZmxhZ3MgfD0gRUVfQVBQTElDQVRJT047CiAKIAlkcF9mbGFn
cyA9IGJlMzJfdG9fY3B1KHAtPmRwX2ZsYWdzKTsKLQlvcCA9IHdpcmVfZmxhZ3NfdG9fYmlvX29w
KGRwX2ZsYWdzKTsKLQlvcF9mbGFncyA9IHdpcmVfZmxhZ3NfdG9fYmlvX2ZsYWdzKGRwX2ZsYWdz
KTsKKwlwZWVyX3JlcS0+b3BmID0gd2lyZV9mbGFnc190b19iaW8oY29ubmVjdGlvbiwgZHBfZmxh
Z3MpOwogCWlmIChwaS0+Y21kID09IFBfVFJJTSkgewogCQlEX0FTU0VSVChwZWVyX2RldmljZSwg
cGVlcl9yZXEtPmkuc2l6ZSA+IDApOwotCQlEX0FTU0VSVChwZWVyX2RldmljZSwgb3AgPT0gUkVR
X09QX0RJU0NBUkQpOworCQlEX0FTU0VSVChwZWVyX2RldmljZSwgcGVlcl9yZXFfb3AocGVlcl9y
ZXEpID09IFJFUV9PUF9ESVNDQVJEKTsKIAkJRF9BU1NFUlQocGVlcl9kZXZpY2UsIHBlZXJfcmVx
LT5wYWdlcyA9PSBOVUxMKTsKIAkJLyogbmVlZCB0byBwbGF5IHNhZmU6IGFuIG9sZGVyIERSQkQg
c2VuZGVyCiAJCSAqIG1heSBtZWFuIHplcm8tb3V0IHdoaWxlIHNlbmRpbmcgUF9UUklNLiAqLwpA
QCAtMjU5MCw3ICsyNjA2LDcgQEAgc3RhdGljIGludCByZWNlaXZlX0RhdGEoc3RydWN0IGRyYmRf
Y29ubmVjdGlvbiAqY29ubmVjdGlvbiwgc3RydWN0IHBhY2tldF9pbmZvICoKIAkJCXBlZXJfcmVx
LT5mbGFncyB8PSBFRV9aRVJPT1VUOwogCX0gZWxzZSBpZiAocGktPmNtZCA9PSBQX1pFUk9FUykg
ewogCQlEX0FTU0VSVChwZWVyX2RldmljZSwgcGVlcl9yZXEtPmkuc2l6ZSA+IDApOwotCQlEX0FT
U0VSVChwZWVyX2RldmljZSwgb3AgPT0gUkVRX09QX1dSSVRFX1pFUk9FUyk7CisJCURfQVNTRVJU
KHBlZXJfZGV2aWNlLCBwZWVyX3JlcV9vcChwZWVyX3JlcSkgPT0gUkVRX09QX1dSSVRFX1pFUk9F
Uyk7CiAJCURfQVNTRVJUKHBlZXJfZGV2aWNlLCBwZWVyX3JlcS0+cGFnZXMgPT0gTlVMTCk7CiAJ
CS8qIERvIChub3QpIHBhc3MgZG93biBCTEtERVZfWkVST19OT1VOTUFQPyAqLwogCQlpZiAoZHBf
ZmxhZ3MgJiBEUF9ESVNDQVJEKQpAQCAtMjY3Nyw4ICsyNjkzLDcgQEAgc3RhdGljIGludCByZWNl
aXZlX0RhdGEoc3RydWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVjdGlvbiwgc3RydWN0IHBhY2tl
dF9pbmZvICoKIAkJcGVlcl9yZXEtPmZsYWdzIHw9IEVFX0NBTExfQUxfQ09NUExFVEVfSU87CiAJ
fQogCi0JZXJyID0gZHJiZF9zdWJtaXRfcGVlcl9yZXF1ZXN0KGRldmljZSwgcGVlcl9yZXEsIG9w
IHwgb3BfZmxhZ3MsCi0JCQkJICAgICAgIERSQkRfRkFVTFRfRFRfV1IpOworCWVyciA9IGRyYmRf
c3VibWl0X3BlZXJfcmVxdWVzdChwZWVyX3JlcSk7CiAJaWYgKCFlcnIpCiAJCXJldHVybiAwOwog
CkBAIC0yNzg5LDcgKzI4MDQsNiBAQCBzdGF0aWMgaW50IHJlY2VpdmVfRGF0YVJlcXVlc3Qoc3Ry
dWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVjdGlvbiwgc3RydWN0IHBhY2tldAogCXN0cnVjdCBk
cmJkX3BlZXJfcmVxdWVzdCAqcGVlcl9yZXE7CiAJc3RydWN0IGRpZ2VzdF9pbmZvICpkaSA9IE5V
TEw7CiAJaW50IHNpemUsIHZlcmI7Ci0JdW5zaWduZWQgaW50IGZhdWx0X3R5cGU7CiAJc3RydWN0
IHBfYmxvY2tfcmVxICpwID0JcGktPmRhdGE7CiAKIAlwZWVyX2RldmljZSA9IGNvbm5fcGVlcl9k
ZXZpY2UoY29ubmVjdGlvbiwgcGktPnZucik7CkBAIC0yODQ5LDExICsyODYzLDExIEBAIHN0YXRp
YyBpbnQgcmVjZWl2ZV9EYXRhUmVxdWVzdChzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0
aW9uLCBzdHJ1Y3QgcGFja2V0CiAJCXB1dF9sZGV2KGRldmljZSk7CiAJCXJldHVybiAtRU5PTUVN
OwogCX0KKwlwZWVyX3JlcS0+b3BmID0gUkVRX09QX1JFQUQ7CiAKIAlzd2l0Y2ggKHBpLT5jbWQp
IHsKIAljYXNlIFBfREFUQV9SRVFVRVNUOgogCQlwZWVyX3JlcS0+dy5jYiA9IHdfZV9lbmRfZGF0
YV9yZXE7Ci0JCWZhdWx0X3R5cGUgPSBEUkJEX0ZBVUxUX0RUX1JEOwogCQkvKiBhcHBsaWNhdGlv
biBJTywgZG9uJ3QgZHJiZF9yc19iZWdpbl9pbyAqLwogCQlwZWVyX3JlcS0+ZmxhZ3MgfD0gRUVf
QVBQTElDQVRJT047CiAJCWdvdG8gc3VibWl0OwpAQCAtMjg2NywxNCArMjg4MSwxMiBAQCBzdGF0
aWMgaW50IHJlY2VpdmVfRGF0YVJlcXVlc3Qoc3RydWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVj
dGlvbiwgc3RydWN0IHBhY2tldAogCQlmYWxsdGhyb3VnaDsKIAljYXNlIFBfUlNfREFUQV9SRVFV
RVNUOgogCQlwZWVyX3JlcS0+dy5jYiA9IHdfZV9lbmRfcnNkYXRhX3JlcTsKLQkJZmF1bHRfdHlw
ZSA9IERSQkRfRkFVTFRfUlNfUkQ7CiAJCS8qIHVzZWQgaW4gdGhlIHNlY3RvciBvZmZzZXQgcHJv
Z3Jlc3MgZGlzcGxheSAqLwogCQlkZXZpY2UtPmJtX3Jlc3luY19mbyA9IEJNX1NFQ1RfVE9fQklU
KHNlY3Rvcik7CiAJCWJyZWFrOwogCiAJY2FzZSBQX09WX1JFUExZOgogCWNhc2UgUF9DU1VNX1JT
X1JFUVVFU1Q6Ci0JCWZhdWx0X3R5cGUgPSBEUkJEX0ZBVUxUX1JTX1JEOwogCQlkaSA9IGttYWxs
b2Moc2l6ZW9mKCpkaSkgKyBwaS0+c2l6ZSwgR0ZQX05PSU8pOwogCQlpZiAoIWRpKQogCQkJZ290
byBvdXRfZnJlZV9lOwpAQCAtMjkyMyw3ICsyOTM1LDYgQEAgc3RhdGljIGludCByZWNlaXZlX0Rh
dGFSZXF1ZXN0KHN0cnVjdCBkcmJkX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24sIHN0cnVjdCBwYWNr
ZXQKIAkJCQkJKHVuc2lnbmVkIGxvbmcgbG9uZylzZWN0b3IpOwogCQl9CiAJCXBlZXJfcmVxLT53
LmNiID0gd19lX2VuZF9vdl9yZXE7Ci0JCWZhdWx0X3R5cGUgPSBEUkJEX0ZBVUxUX1JTX1JEOwog
CQlicmVhazsKIAogCWRlZmF1bHQ6CkBAIC0yOTc1LDggKzI5ODYsNyBAQCBzdGF0aWMgaW50IHJl
Y2VpdmVfRGF0YVJlcXVlc3Qoc3RydWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVjdGlvbiwgc3Ry
dWN0IHBhY2tldAogc3VibWl0OgogCXVwZGF0ZV9yZWNlaXZlcl90aW1pbmdfZGV0YWlscyhjb25u
ZWN0aW9uLCBkcmJkX3N1Ym1pdF9wZWVyX3JlcXVlc3QpOwogCWluY191bmFja2VkKGRldmljZSk7
Ci0JaWYgKGRyYmRfc3VibWl0X3BlZXJfcmVxdWVzdChkZXZpY2UsIHBlZXJfcmVxLCBSRVFfT1Bf
UkVBRCwKLQkJCQkgICAgIGZhdWx0X3R5cGUpID09IDApCisJaWYgKGRyYmRfc3VibWl0X3BlZXJf
cmVxdWVzdChwZWVyX3JlcSkgPT0gMCkKIAkJcmV0dXJuIDA7CiAKIAkvKiBkb24ndCBjYXJlIGZv
ciB0aGUgcmVhc29uIGhlcmUgKi8KQEAgLTQ5NDcsNyArNDk1Nyw2IEBAIHN0YXRpYyBpbnQgcmVj
ZWl2ZV9yc19kZWFsbG9jYXRlZChzdHJ1Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0aW9uLCBz
dHJ1Y3QgcGFjCiAKIAlpZiAoZ2V0X2xkZXYoZGV2aWNlKSkgewogCQlzdHJ1Y3QgZHJiZF9wZWVy
X3JlcXVlc3QgKnBlZXJfcmVxOwotCQljb25zdCBlbnVtIHJlcV9vcCBvcCA9IFJFUV9PUF9XUklU
RV9aRVJPRVM7CiAKIAkJcGVlcl9yZXEgPSBkcmJkX2FsbG9jX3BlZXJfcmVxKHBlZXJfZGV2aWNl
LCBJRF9TWU5DRVIsIHNlY3RvciwKIAkJCQkJICAgICAgIHNpemUsIDAsIEdGUF9OT0lPKTsKQEAg
LTQ5NTcsNiArNDk2Niw3IEBAIHN0YXRpYyBpbnQgcmVjZWl2ZV9yc19kZWFsbG9jYXRlZChzdHJ1
Y3QgZHJiZF9jb25uZWN0aW9uICpjb25uZWN0aW9uLCBzdHJ1Y3QgcGFjCiAJCX0KIAogCQlwZWVy
X3JlcS0+dy5jYiA9IGVfZW5kX3Jlc3luY19ibG9jazsKKwkJcGVlcl9yZXEtPm9wZiA9IFJFUV9P
UF9ESVNDQVJEOwogCQlwZWVyX3JlcS0+c3VibWl0X2ppZiA9IGppZmZpZXM7CiAJCXBlZXJfcmVx
LT5mbGFncyB8PSBFRV9UUklNOwogCkBAIC00OTY1LDggKzQ5NzUsNyBAQCBzdGF0aWMgaW50IHJl
Y2VpdmVfcnNfZGVhbGxvY2F0ZWQoc3RydWN0IGRyYmRfY29ubmVjdGlvbiAqY29ubmVjdGlvbiwg
c3RydWN0IHBhYwogCQlzcGluX3VubG9ja19pcnEoJmRldmljZS0+cmVzb3VyY2UtPnJlcV9sb2Nr
KTsKIAogCQlhdG9taWNfYWRkKHBpLT5zaXplID4+IDksICZkZXZpY2UtPnJzX3NlY3RfZXYpOwot
CQllcnIgPSBkcmJkX3N1Ym1pdF9wZWVyX3JlcXVlc3QoZGV2aWNlLCBwZWVyX3JlcSwgb3AsCi0J
CQkJCSAgICAgICBEUkJEX0ZBVUxUX1JTX1dSKTsKKwkJZXJyID0gZHJiZF9zdWJtaXRfcGVlcl9y
ZXF1ZXN0KHBlZXJfcmVxKTsKIAogCQlpZiAoZXJyKSB7CiAJCQlzcGluX2xvY2tfaXJxKCZkZXZp
Y2UtPnJlc291cmNlLT5yZXFfbG9jayk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF93b3JrZXIuYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX3dvcmtlci5jCmluZGV4IDBi
YjFhOTAwYzJkNS4uYzY5YmVlZmM5ZDVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Jsb2NrL2RyYmQv
ZHJiZF93b3JrZXIuYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF93b3JrZXIuYwpAQCAt
NDAwLDEzICs0MDAsMTMgQEAgc3RhdGljIGludCByZWFkX2Zvcl9jc3VtKHN0cnVjdCBkcmJkX3Bl
ZXJfZGV2aWNlICpwZWVyX2RldmljZSwgc2VjdG9yX3Qgc2VjdG9yLAogCQlnb3RvIGRlZmVyOwog
CiAJcGVlcl9yZXEtPncuY2IgPSB3X2Vfc2VuZF9jc3VtOworCXBlZXJfcmVxLT5vcGYgPSBSRVFf
T1BfUkVBRDsKIAlzcGluX2xvY2tfaXJxKCZkZXZpY2UtPnJlc291cmNlLT5yZXFfbG9jayk7CiAJ
bGlzdF9hZGRfdGFpbCgmcGVlcl9yZXEtPncubGlzdCwgJmRldmljZS0+cmVhZF9lZSk7CiAJc3Bp
bl91bmxvY2tfaXJxKCZkZXZpY2UtPnJlc291cmNlLT5yZXFfbG9jayk7CiAKIAlhdG9taWNfYWRk
KHNpemUgPj4gOSwgJmRldmljZS0+cnNfc2VjdF9ldik7Ci0JaWYgKGRyYmRfc3VibWl0X3BlZXJf
cmVxdWVzdChkZXZpY2UsIHBlZXJfcmVxLCBSRVFfT1BfUkVBRCwKLQkJCQkgICAgIERSQkRfRkFV
TFRfUlNfUkQpID09IDApCisJaWYgKGRyYmRfc3VibWl0X3BlZXJfcmVxdWVzdChwZWVyX3JlcSkg
PT0gMCkKIAkJcmV0dXJuIDA7CiAKIAkvKiBJZiBpdCBmYWlsZWQgYmVjYXVzZSBvZiBFTk9NRU0s
IHJldHJ5IHNob3VsZCBoZWxwLiAgSWYgaXQgZmFpbGVkCi0tIAoyLjM4LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlz
dApkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
