Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 547186D0121
	for <lists+drbd-dev@lfdr.de>; Thu, 30 Mar 2023 12:28:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3BDA74210D8;
	Thu, 30 Mar 2023 12:28:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B5B9742061C
	for <drbd-dev@lists.linbit.com>; Thu, 30 Mar 2023 12:27:49 +0200 (CEST)
Received: by mail-wr1-f45.google.com with SMTP id v1so18542324wrv.1
	for <drbd-dev@lists.linbit.com>; Thu, 30 Mar 2023 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112; t=1680172069;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=0zMenm1DZpmHocR+5Pohn/nlHFQgV1jhAeYfGdQoef0=;
	b=IkZDbJDpMPzQRtZHRJvovLadMdzAd+SRx2aObpfWLH2VEl8OAwN/9PyG/SNXyUF4Z+
	5TP2/Q7EOEWXQLX6yha1AV/M+08uJB/HYiTG/DBDrfg4s+0nYK/dzdA1INywl8pbzoYM
	UoKrS3P37etkxbyIhI0b74uDjIP4a2BSoD6B2QKGlNHfV7lxsAzfAbJ1dEgIysYyebR4
	EtUHbydQiGjqU8TjMuBqC2XIIyHP27ZETFMHC8j3PPz+i4CMsSq9EVXjf4naMVHphndM
	2svTSwMst46MVuq2SIHZ9H3bW0zapv7n6mvFev7q9cSvBru1/+cP880QwzYTMSwl9tlQ
	TwOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1680172069;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=0zMenm1DZpmHocR+5Pohn/nlHFQgV1jhAeYfGdQoef0=;
	b=bo/yXVCDM96XbvmmP73Nwcmf/fyA09tcWJi8AFlFEBfeJiE8Dsk4jb7v00HRtIRy5e
	lyFimDBGrgTCAlDQ2NCZi9QZxSf6LQumiQyZSnlcOKIX1uEeiiWM/aU+J4pz2OKeenHr
	4/v29xJQ9Ol5GidYyeNYOnJSZ99+iOtKO4Nwyc2eVGKdYKU5HvPPFJLm+9H4DmmJwU23
	nOMIDmbzBTxuMDVxLu5hlUpERnHouxNTRWy1/pj0yVvPiIQeB3gSropaHTxDG8IMaJzc
	IsJy28OYycuHDAO4rSibg/wckNED8cVEEwEyT+IG2+IOPT1f+yD+MV+MuAH3wKFVQ5M7
	B5QA==
X-Gm-Message-State: AAQBX9dO+ql2BgzswHOd69ZTBDx/dkRHo2Aw8c7bv0arrqhczjbYcb/C
	rnZeNP3cEaeXWL7dFl5HMaC2RIGO
X-Google-Smtp-Source: AKy350YNTr9iU5PMyf0dtk1XSu7+m2gGnTT+oWZcNNxu2dPqnZkerqTVFTJJUGDTRemcjWti8zvFrw==
X-Received: by 2002:a5d:4bc2:0:b0:2e5:2e0a:d958 with SMTP id
	l2-20020a5d4bc2000000b002e52e0ad958mr238752wrt.65.1680172069377;
	Thu, 30 Mar 2023 03:27:49 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	s11-20020adff80b000000b002d6f285c0a2sm26352514wrp.42.2023.03.30.03.27.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Mar 2023 03:27:49 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 30 Mar 2023 12:27:39 +0200
Message-Id: <20230330102744.2128122-3-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
References: <20230330102744.2128122-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Cc: Andreas Gruenbacher <agruen@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v3 2/7] drbd: Rip out the ERR_IF_CNT_IS_NEGATIVE
	macro
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

RnJvbTogQW5kcmVhcyBHcnVlbmJhY2hlciA8YWdydWVuQGxpbmJpdC5jb20+CgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1ZW5AbGluYml0LmNvbT4KU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoIELDtmhtd2FsZGVyIDxjaHJpc3RvcGguYm9laG13YWxkZXJAbGluYml0LmNv
bT4KLS0tCiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaCB8IDM3ICsrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50
LmggYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9pbnQuaAppbmRleCBkODliN2QwM2Q0YzguLjc3
MjAyM2FjZTc0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKKysr
IGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfaW50LmgKQEAgLTE5MTgsMTggKzE5MTgsMTQgQEAg
c3RhdGljIGlubGluZSB2b2lkIGluY19hcF9wZW5kaW5nKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2
aWNlKQogCWF0b21pY19pbmMoJmRldmljZS0+YXBfcGVuZGluZ19jbnQpOwogfQogCi0jZGVmaW5l
IEVSUl9JRl9DTlRfSVNfTkVHQVRJVkUod2hpY2gsIGZ1bmMsIGxpbmUpCQkJXAotCWlmIChhdG9t
aWNfcmVhZCgmZGV2aWNlLT53aGljaCkgPCAwKQkJCQlcCi0JCWRyYmRfZXJyKGRldmljZSwgImlu
ICVzOiVkOiAiICN3aGljaCAiID0gJWQgPCAwICFcbiIsCVwKLQkJCWZ1bmMsIGxpbmUsCQkJCQlc
Ci0JCQlhdG9taWNfcmVhZCgmZGV2aWNlLT53aGljaCkpCi0KLSNkZWZpbmUgZGVjX2FwX3BlbmRp
bmcoZGV2aWNlKSBfZGVjX2FwX3BlbmRpbmcoZGV2aWNlLCBfX2Z1bmNfXywgX19MSU5FX18pCi1z
dGF0aWMgaW5saW5lIHZvaWQgX2RlY19hcF9wZW5kaW5nKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2
aWNlLCBjb25zdCBjaGFyICpmdW5jLCBpbnQgbGluZSkKKyNkZWZpbmUgZGVjX2FwX3BlbmRpbmco
ZGV2aWNlKSAoKHZvaWQpZXhwZWN0KChkZXZpY2UpLCBfX2RlY19hcF9wZW5kaW5nKGRldmljZSkg
Pj0gMCkpCitzdGF0aWMgaW5saW5lIGludCBfX2RlY19hcF9wZW5kaW5nKHN0cnVjdCBkcmJkX2Rl
dmljZSAqZGV2aWNlKQogewotCWlmIChhdG9taWNfZGVjX2FuZF90ZXN0KCZkZXZpY2UtPmFwX3Bl
bmRpbmdfY250KSkKKwlpbnQgYXBfcGVuZGluZ19jbnQgPSBhdG9taWNfZGVjX3JldHVybigmZGV2
aWNlLT5hcF9wZW5kaW5nX2NudCk7CisKKwlpZiAoYXBfcGVuZGluZ19jbnQgPT0gMCkKIAkJd2Fr
ZV91cCgmZGV2aWNlLT5taXNjX3dhaXQpOwotCUVSUl9JRl9DTlRfSVNfTkVHQVRJVkUoYXBfcGVu
ZGluZ19jbnQsIGZ1bmMsIGxpbmUpOworCXJldHVybiBhcF9wZW5kaW5nX2NudDsKIH0KIAogLyog
Y291bnRzIGhvdyBtYW55IHJlc3luYy1yZWxhdGVkIGFuc3dlcnMgd2Ugc3RpbGwgZXhwZWN0IGZy
b20gdGhlIHBlZXIKQEAgLTE5NDMsMTEgKzE5MzksMTAgQEAgc3RhdGljIGlubGluZSB2b2lkIGlu
Y19yc19wZW5kaW5nKHN0cnVjdCBkcmJkX2RldmljZSAqZGV2aWNlKQogCWF0b21pY19pbmMoJmRl
dmljZS0+cnNfcGVuZGluZ19jbnQpOwogfQogCi0jZGVmaW5lIGRlY19yc19wZW5kaW5nKGRldmlj
ZSkgX2RlY19yc19wZW5kaW5nKGRldmljZSwgX19mdW5jX18sIF9fTElORV9fKQotc3RhdGljIGlu
bGluZSB2b2lkIF9kZWNfcnNfcGVuZGluZyhzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRldmljZSwgY29u
c3QgY2hhciAqZnVuYywgaW50IGxpbmUpCisjZGVmaW5lIGRlY19yc19wZW5kaW5nKGRldmljZSkg
KCh2b2lkKWV4cGVjdCgoZGV2aWNlKSwgX19kZWNfcnNfcGVuZGluZyhkZXZpY2UpID49IDApKQor
c3RhdGljIGlubGluZSBpbnQgX19kZWNfcnNfcGVuZGluZyhzdHJ1Y3QgZHJiZF9kZXZpY2UgKmRl
dmljZSkKIHsKLQlhdG9taWNfZGVjKCZkZXZpY2UtPnJzX3BlbmRpbmdfY250KTsKLQlFUlJfSUZf
Q05UX0lTX05FR0FUSVZFKHJzX3BlbmRpbmdfY250LCBmdW5jLCBsaW5lKTsKKwlyZXR1cm4gYXRv
bWljX2RlY19yZXR1cm4oJmRldmljZS0+cnNfcGVuZGluZ19jbnQpOwogfQogCiAvKiBjb3VudHMg
aG93IG1hbnkgYW5zd2VycyB3ZSBzdGlsbCBuZWVkIHRvIHNlbmQgdG8gdGhlIHBlZXIuCkBAIC0x
OTY0LDE4ICsxOTU5LDE2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbmNfdW5hY2tlZChzdHJ1Y3Qg
ZHJiZF9kZXZpY2UgKmRldmljZSkKIAlhdG9taWNfaW5jKCZkZXZpY2UtPnVuYWNrZWRfY250KTsK
IH0KIAotI2RlZmluZSBkZWNfdW5hY2tlZChkZXZpY2UpIF9kZWNfdW5hY2tlZChkZXZpY2UsIF9f
ZnVuY19fLCBfX0xJTkVfXykKLXN0YXRpYyBpbmxpbmUgdm9pZCBfZGVjX3VuYWNrZWQoc3RydWN0
IGRyYmRfZGV2aWNlICpkZXZpY2UsIGNvbnN0IGNoYXIgKmZ1bmMsIGludCBsaW5lKQorI2RlZmlu
ZSBkZWNfdW5hY2tlZChkZXZpY2UpICgodm9pZClleHBlY3QoZGV2aWNlLCBfX2RlY191bmFja2Vk
KGRldmljZSkgPj0gMCkpCitzdGF0aWMgaW5saW5lIGludCBfX2RlY191bmFja2VkKHN0cnVjdCBk
cmJkX2RldmljZSAqZGV2aWNlKQogewotCWF0b21pY19kZWMoJmRldmljZS0+dW5hY2tlZF9jbnQp
OwotCUVSUl9JRl9DTlRfSVNfTkVHQVRJVkUodW5hY2tlZF9jbnQsIGZ1bmMsIGxpbmUpOworCXJl
dHVybiBhdG9taWNfZGVjX3JldHVybigmZGV2aWNlLT51bmFja2VkX2NudCk7CiB9CiAKLSNkZWZp
bmUgc3ViX3VuYWNrZWQoZGV2aWNlLCBuKSBfc3ViX3VuYWNrZWQoZGV2aWNlLCBuLCBfX2Z1bmNf
XywgX19MSU5FX18pCi1zdGF0aWMgaW5saW5lIHZvaWQgX3N1Yl91bmFja2VkKHN0cnVjdCBkcmJk
X2RldmljZSAqZGV2aWNlLCBpbnQgbiwgY29uc3QgY2hhciAqZnVuYywgaW50IGxpbmUpCisjZGVm
aW5lIHN1Yl91bmFja2VkKGRldmljZSwgbikgKCh2b2lkKWV4cGVjdChkZXZpY2UsIF9fc3ViX3Vu
YWNrZWQoZGV2aWNlKSA+PSAwKSkKK3N0YXRpYyBpbmxpbmUgaW50IF9fc3ViX3VuYWNrZWQoc3Ry
dWN0IGRyYmRfZGV2aWNlICpkZXZpY2UsIGludCBuKQogewotCWF0b21pY19zdWIobiwgJmRldmlj
ZS0+dW5hY2tlZF9jbnQpOwotCUVSUl9JRl9DTlRfSVNfTkVHQVRJVkUodW5hY2tlZF9jbnQsIGZ1
bmMsIGxpbmUpOworCXJldHVybiBhdG9taWNfc3ViX3JldHVybihuLCAmZGV2aWNlLT51bmFja2Vk
X2NudCk7CiB9CiAKIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19zeW5jX3RhcmdldF9zdGF0ZShlbnVt
IGRyYmRfY29ubnMgY29ubmVjdGlvbl9zdGF0ZSkKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRy
YmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4v
bGlzdGluZm8vZHJiZC1kZXYK
