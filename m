Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E00B133ABE9
	for <lists+drbd-dev@lfdr.de>; Mon, 15 Mar 2021 08:01:42 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 28B554260C6;
	Mon, 15 Mar 2021 08:01:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 67BE242061A
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 11:55:43 +0100 (CET)
Received: by mail-wr1-f42.google.com with SMTP id k8so1516587wrc.3
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ra48pT9rfpiijjx5/hqCOGUdkD2PZ1gvyu+SmCrCjD4=;
	b=Oef+d4eRWh1sAVKLw1nPhinRKqgeXpg/GUlyB4VHS87v+IMN6D8TxBv1W64GWviozS
	VoIEf+MupbFHJFaNddKk1CGZfBGSchQpUsXuDWcwTdiJ3KRmd4gPqtLIfy29kogPBbgu
	hjixb95FG3Isvqs/BhAjWAm923IKAVF7M+mi70eSov3NFrbG0RwI7Zel83ln6I/2VszK
	f7bWbDXZZBKhU59Pnpnh3itv2dH5MchQgMwyJak0kjvEA4xUvZFS1C+XdkiXRX6tMfQw
	Ii+IuYZ74uJiRQHgtzit+eUkURgREtTUka8Xb1LXjJgnvNFtYqGapKdTzKmhD68hj71T
	pCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ra48pT9rfpiijjx5/hqCOGUdkD2PZ1gvyu+SmCrCjD4=;
	b=XagxAtVYqSdHAYrJevpueXuwPlGsEBWgSF4+od3m6a9XbV+oa+uahmHUdyjLnxS/xX
	NxS4Pzs9TnIhdorzbGGlIW5rxlIVuaawvUCPzctC24Zf5q170uITrQKZvIUcz5SdGv/S
	Oy8+3FpJ87kmylkl+La7biuTLI7RuTs/zRH9ekuSSaRhxFzz+z+C4csfi51xagChe++Z
	bugDhsZ+imGnPrCc21vOn1wTJhbmSiu9LBr9T2+fvXpmPXZ1W2PBH2gLcM9vVY+CwYeA
	FOowZJCEfDBYYFXPT2AkaCvnum1Lz04aXVmzCFp6hYhR3ccQgLtxgpN6xoMlH3/QswdB
	u+nw==
X-Gm-Message-State: AOAM532n/+fp+oBdccnKvgQdRdPhrMcel2Dfgz+ZHU4uCyUgCR4PM1V+
	LXAu/IqYtYvX1BHTphiEa0UcKg==
X-Google-Smtp-Source: ABdhPJzMqLsZXEdmvMOw6kJWzAJoj5oRWwuNxlJb3z7y5Zj3s4CdlgUTzAeRsuGUgysF2Ux1mr9chQ==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr13284518wrd.126.1615546542769;
	Fri, 12 Mar 2021 02:55:42 -0800 (PST)
Received: from dell.default ([91.110.221.204])
	by smtp.gmail.com with ESMTPSA id
	q15sm7264962wrr.58.2021.03.12.02.55.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 12 Mar 2021 02:55:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 12 Mar 2021 10:55:26 +0000
Message-Id: <20210312105530.2219008-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:01:35 +0100
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 07/11] block: drbd: drbd_nl: Make conversion to
	'enum drbd_ret_code' explicit
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

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZnJvbSBk
cml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5jOjI0OgogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bmwuYzogSW4gZnVuY3Rpb24g4oCYZHJiZF9hZG1fc2V0X3JvbGXigJk6CiBkcml2ZXJzL2Jsb2Nr
L2RyYmQvZHJiZF9ubC5jOjc5MzoxMTogd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9t
IOKAmGVudW0gZHJiZF9zdGF0ZV9yduKAmSB0byDigJhlbnVtIGRyYmRfcmV0X2NvZGXigJkgWy1X
ZW51bS1jb252ZXJzaW9uXQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzo3OTU6MTE6IHdh
cm5pbmc6IGltcGxpY2l0IGNvbnZlcnNpb24gZnJvbSDigJhlbnVtIGRyYmRfc3RhdGVfcnbigJkg
dG8g4oCYZW51bSBkcmJkX3JldF9jb2Rl4oCZIFstV2VudW0tY29udmVyc2lvbl0KIGRyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX25sLmM6IEluIGZ1bmN0aW9uIOKAmGRyYmRfYWRtX2F0dGFjaOKAmToK
IGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmM6MTk2NToxMDogd2FybmluZzogaW1wbGljaXQg
Y29udmVyc2lvbiBmcm9tIOKAmGVudW0gZHJiZF9zdGF0ZV9yduKAmSB0byDigJhlbnVtIGRyYmRf
cmV0X2NvZGXigJkgWy1XZW51bS1jb252ZXJzaW9uXQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bmwuYzogSW4gZnVuY3Rpb24g4oCYZHJiZF9hZG1fY29ubmVjdOKAmToKIGRyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX25sLmM6MjY5MDoxMDogd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9t
IOKAmGVudW0gZHJiZF9zdGF0ZV9yduKAmSB0byDigJhlbnVtIGRyYmRfcmV0X2NvZGXigJkgWy1X
ZW51bS1jb252ZXJzaW9uXQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzogSW4gZnVuY3Rp
b24g4oCYZHJiZF9hZG1fZGlzY29ubmVjdOKAmToKIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25s
LmM6MjgwMzoxMTogd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIOKAmGVudW0gZHJi
ZF9zdGF0ZV9yduKAmSB0byDigJhlbnVtIGRyYmRfcmV0X2NvZGXigJkgWy1XZW51bS1jb252ZXJz
aW9uXQoKQ2M6IFBoaWxpcHAgUmVpc25lciA8cGhpbGlwcC5yZWlzbmVyQGxpbmJpdC5jb20+CkNj
OiBMYXJzIEVsbGVuYmVyZyA8bGFycy5lbGxlbmJlcmdAbGluYml0LmNvbT4KQ2M6IEplbnMgQXhi
b2UgPGF4Ym9lQGtlcm5lbC5kaz4KQ2M6IGRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KQ2M6IGxp
bnV4LWJsb2NrQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMgfCAxMyAr
KysrKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMgYi9kcml2ZXJz
L2Jsb2NrL2RyYmQvZHJiZF9ubC5jCmluZGV4IGJmN2RlNGM3Yjk2YzEuLjMxOTAyMzA0ZGRhYzcg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKKysrIGIvZHJpdmVycy9i
bG9jay9kcmJkL2RyYmRfbmwuYwpAQCAtNzkwLDkgKzc5MCwxMSBAQCBpbnQgZHJiZF9hZG1fc2V0
X3JvbGUoc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqaW5mbykKIAltdXRl
eF9sb2NrKCZhZG1fY3R4LnJlc291cmNlLT5hZG1fbXV0ZXgpOwogCiAJaWYgKGluZm8tPmdlbmxo
ZHItPmNtZCA9PSBEUkJEX0FETV9QUklNQVJZKQotCQlyZXRjb2RlID0gZHJiZF9zZXRfcm9sZShh
ZG1fY3R4LmRldmljZSwgUl9QUklNQVJZLCBwYXJtcy5hc3N1bWVfdXB0b2RhdGUpOworCQlyZXRj
b2RlID0gKGVudW0gZHJiZF9yZXRfY29kZSlkcmJkX3NldF9yb2xlKGFkbV9jdHguZGV2aWNlLAor
CQkJCQkJUl9QUklNQVJZLCBwYXJtcy5hc3N1bWVfdXB0b2RhdGUpOwogCWVsc2UKLQkJcmV0Y29k
ZSA9IGRyYmRfc2V0X3JvbGUoYWRtX2N0eC5kZXZpY2UsIFJfU0VDT05EQVJZLCAwKTsKKwkJcmV0
Y29kZSA9IChlbnVtIGRyYmRfcmV0X2NvZGUpZHJiZF9zZXRfcm9sZShhZG1fY3R4LmRldmljZSwK
KwkJCQkJCVJfU0VDT05EQVJZLCAwKTsKIAogCW11dGV4X3VubG9jaygmYWRtX2N0eC5yZXNvdXJj
ZS0+YWRtX211dGV4KTsKIAlnZW5sX2xvY2soKTsKQEAgLTE5NjIsNyArMTk2NCw3IEBAIGludCBk
cmJkX2FkbV9hdHRhY2goc3RydWN0IHNrX2J1ZmYgKnNrYiwgc3RydWN0IGdlbmxfaW5mbyAqaW5m
bykKIAlkcmJkX2ZsdXNoX3dvcmtxdWV1ZSgmY29ubmVjdGlvbi0+c2VuZGVyX3dvcmspOwogCiAJ
cnYgPSBfZHJiZF9yZXF1ZXN0X3N0YXRlKGRldmljZSwgTlMoZGlzaywgRF9BVFRBQ0hJTkcpLCBD
U19WRVJCT1NFKTsKLQlyZXRjb2RlID0gcnY7ICAvKiBGSVhNRTogVHlwZSBtaXNtYXRjaC4gKi8K
KwlyZXRjb2RlID0gKGVudW0gZHJiZF9yZXRfY29kZSlydjsKIAlkcmJkX3Jlc3VtZV9pbyhkZXZp
Y2UpOwogCWlmIChydiA8IFNTX1NVQ0NFU1MpCiAJCWdvdG8gZmFpbDsKQEAgLTI2ODcsNyArMjY4
OSw4IEBAIGludCBkcmJkX2FkbV9jb25uZWN0KHN0cnVjdCBza19idWZmICpza2IsIHN0cnVjdCBn
ZW5sX2luZm8gKmluZm8pCiAJfQogCXJjdV9yZWFkX3VubG9jaygpOwogCi0JcmV0Y29kZSA9IGNv
bm5fcmVxdWVzdF9zdGF0ZShjb25uZWN0aW9uLCBOUyhjb25uLCBDX1VOQ09OTkVDVEVEKSwgQ1Nf
VkVSQk9TRSk7CisJcmV0Y29kZSA9IChlbnVtIGRyYmRfcmV0X2NvZGUpY29ubl9yZXF1ZXN0X3N0
YXRlKGNvbm5lY3Rpb24sCisJCQkJCU5TKGNvbm4sIENfVU5DT05ORUNURUQpLCBDU19WRVJCT1NF
KTsKIAogCWNvbm5fcmVjb25maWdfZG9uZShjb25uZWN0aW9uKTsKIAltdXRleF91bmxvY2soJmFk
bV9jdHgucmVzb3VyY2UtPmFkbV9tdXRleCk7CkBAIC0yODAwLDcgKzI4MDMsNyBAQCBpbnQgZHJi
ZF9hZG1fZGlzY29ubmVjdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgZ2VubF9pbmZvICpp
bmZvKQogCW11dGV4X2xvY2soJmFkbV9jdHgucmVzb3VyY2UtPmFkbV9tdXRleCk7CiAJcnYgPSBj
b25uX3RyeV9kaXNjb25uZWN0KGNvbm5lY3Rpb24sIHBhcm1zLmZvcmNlX2Rpc2Nvbm5lY3QpOwog
CWlmIChydiA8IFNTX1NVQ0NFU1MpCi0JCXJldGNvZGUgPSBydjsgIC8qIEZJWE1FOiBUeXBlIG1p
c21hdGNoLiAqLworCQlyZXRjb2RlID0gKGVudW0gZHJiZF9yZXRfY29kZSlydjsKIAllbHNlCiAJ
CXJldGNvZGUgPSBOT19FUlJPUjsKIAltdXRleF91bmxvY2soJmFkbV9jdHgucmVzb3VyY2UtPmFk
bV9tdXRleCk7Ci0tIAoyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQu
Y29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
