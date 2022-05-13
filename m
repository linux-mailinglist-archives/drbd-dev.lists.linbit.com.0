Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A0552642C
	for <lists+drbd-dev@lfdr.de>; Fri, 13 May 2022 16:27:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63BE54205FD;
	Fri, 13 May 2022 16:27:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B80E1420219
	for <drbd-dev@lists.linbit.com>;
	Fri, 13 May 2022 16:27:29 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 301B862154;
	Fri, 13 May 2022 14:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A68FC34100;
	Fri, 13 May 2022 14:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652452049;
	bh=sq81QGVFmgwEXyTV9tn2A2eomrsrJjkZ0LhxQElS6oM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KjOOgPcrL8dKnYexrL4irYkNQ4rc9unCDNm44+9jmFCtWE8EXtMdbdqlBXJvNqNNH
	RZmMo8fUn/VsLWjZcQWlxmKwYAKeyKuIXfztvzk6/E9HfbAe8+to8y2UU8+Ijd9bCS
	H+UXbLYNCx0DVP97m0T8zzbTNzVDdCHx8MMVvt90=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 13 May 2022 16:23:47 +0200
Message-Id: <20220513142228.405740832@linuxfoundation.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513142228.303546319@linuxfoundation.org>
References: <20220513142228.303546319@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	stable@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Lee Jones <lee.jones@linaro.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 5.10 03/10] block: drbd: drbd_nl: Make conversion
	to enum drbd_ret_code explicit
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

RnJvbTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KCmNvbW1pdCAxZjFlODdiNGRj
NDU5OGVhYzU3YTY5ODY4NTM0YjkyZDY1ZTQ3ZTgyIHVwc3RyZWFtLgoKRml4ZXMgdGhlIGZvbGxv
d2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZnJvbSBkcml2ZXJzL2Jsb2NrL2Ry
YmQvZHJiZF9ubC5jOjI0OgogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzogSW4gZnVuY3Rp
b24g4oCYZHJiZF9hZG1fc2V0X3JvbGXigJk6CiBkcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9ubC5j
Ojc5MzoxMTogd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIOKAmGVudW0gZHJiZF9z
dGF0ZV9yduKAmSB0byDigJhlbnVtIGRyYmRfcmV0X2NvZGXigJkgWy1XZW51bS1jb252ZXJzaW9u
XQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzo3OTU6MTE6IHdhcm5pbmc6IGltcGxpY2l0
IGNvbnZlcnNpb24gZnJvbSDigJhlbnVtIGRyYmRfc3RhdGVfcnbigJkgdG8g4oCYZW51bSBkcmJk
X3JldF9jb2Rl4oCZIFstV2VudW0tY29udmVyc2lvbl0KIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJk
X25sLmM6IEluIGZ1bmN0aW9uIOKAmGRyYmRfYWRtX2F0dGFjaOKAmToKIGRyaXZlcnMvYmxvY2sv
ZHJiZC9kcmJkX25sLmM6MTk2NToxMDogd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9t
IOKAmGVudW0gZHJiZF9zdGF0ZV9yduKAmSB0byDigJhlbnVtIGRyYmRfcmV0X2NvZGXigJkgWy1X
ZW51bS1jb252ZXJzaW9uXQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzogSW4gZnVuY3Rp
b24g4oCYZHJiZF9hZG1fY29ubmVjdOKAmToKIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmM6
MjY5MDoxMDogd2FybmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIOKAmGVudW0gZHJiZF9z
dGF0ZV9yduKAmSB0byDigJhlbnVtIGRyYmRfcmV0X2NvZGXigJkgWy1XZW51bS1jb252ZXJzaW9u
XQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYzogSW4gZnVuY3Rpb24g4oCYZHJiZF9hZG1f
ZGlzY29ubmVjdOKAmToKIGRyaXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmM6MjgwMzoxMTogd2Fy
bmluZzogaW1wbGljaXQgY29udmVyc2lvbiBmcm9tIOKAmGVudW0gZHJiZF9zdGF0ZV9yduKAmSB0
byDigJhlbnVtIGRyYmRfcmV0X2NvZGXigJkgWy1XZW51bS1jb252ZXJzaW9uXQoKQ2M6IFBoaWxp
cHAgUmVpc25lciA8cGhpbGlwcC5yZWlzbmVyQGxpbmJpdC5jb20+CkNjOiBMYXJzIEVsbGVuYmVy
ZyA8bGFycy5lbGxlbmJlcmdAbGluYml0LmNvbT4KQ2M6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5l
bC5kaz4KQ2M6IGRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KQ2M6IGxpbnV4LWJsb2NrQHZnZXIu
a2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
PgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwMzEyMTA1NTMwLjIyMTkwMDgt
OC1sZWUuam9uZXNAbGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBKZW5zIEF4Ym9lIDxheGJvZUBr
ZXJuZWwuZGs+CkNjOiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+ClNpZ25l
ZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
Ci0tLQogZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbmwuYyB8ICAgMTMgKysrKysrKystLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCi0tLSBhL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX25sLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bmwuYwpAQCAtNzkwLDkgKzc5MCwxMSBAQCBpbnQgZHJiZF9hZG1fc2V0X3JvbGUoc3RydWN0IHNr
X2J1ZmYgKnNrCiAJbXV0ZXhfbG9jaygmYWRtX2N0eC5yZXNvdXJjZS0+YWRtX211dGV4KTsKIAog
CWlmIChpbmZvLT5nZW5saGRyLT5jbWQgPT0gRFJCRF9BRE1fUFJJTUFSWSkKLQkJcmV0Y29kZSA9
IGRyYmRfc2V0X3JvbGUoYWRtX2N0eC5kZXZpY2UsIFJfUFJJTUFSWSwgcGFybXMuYXNzdW1lX3Vw
dG9kYXRlKTsKKwkJcmV0Y29kZSA9IChlbnVtIGRyYmRfcmV0X2NvZGUpZHJiZF9zZXRfcm9sZShh
ZG1fY3R4LmRldmljZSwKKwkJCQkJCVJfUFJJTUFSWSwgcGFybXMuYXNzdW1lX3VwdG9kYXRlKTsK
IAllbHNlCi0JCXJldGNvZGUgPSBkcmJkX3NldF9yb2xlKGFkbV9jdHguZGV2aWNlLCBSX1NFQ09O
REFSWSwgMCk7CisJCXJldGNvZGUgPSAoZW51bSBkcmJkX3JldF9jb2RlKWRyYmRfc2V0X3JvbGUo
YWRtX2N0eC5kZXZpY2UsCisJCQkJCQlSX1NFQ09OREFSWSwgMCk7CiAKIAltdXRleF91bmxvY2so
JmFkbV9jdHgucmVzb3VyY2UtPmFkbV9tdXRleCk7CiAJZ2VubF9sb2NrKCk7CkBAIC0xOTYyLDcg
KzE5NjQsNyBAQCBpbnQgZHJiZF9hZG1fYXR0YWNoKHN0cnVjdCBza19idWZmICpza2IsCiAJZHJi
ZF9mbHVzaF93b3JrcXVldWUoJmNvbm5lY3Rpb24tPnNlbmRlcl93b3JrKTsKIAogCXJ2ID0gX2Ry
YmRfcmVxdWVzdF9zdGF0ZShkZXZpY2UsIE5TKGRpc2ssIERfQVRUQUNISU5HKSwgQ1NfVkVSQk9T
RSk7Ci0JcmV0Y29kZSA9IHJ2OyAgLyogRklYTUU6IFR5cGUgbWlzbWF0Y2guICovCisJcmV0Y29k
ZSA9IChlbnVtIGRyYmRfcmV0X2NvZGUpcnY7CiAJZHJiZF9yZXN1bWVfaW8oZGV2aWNlKTsKIAlp
ZiAocnYgPCBTU19TVUNDRVNTKQogCQlnb3RvIGZhaWw7CkBAIC0yNjg3LDcgKzI2ODksOCBAQCBp
bnQgZHJiZF9hZG1fY29ubmVjdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiCiAJfQogCXJjdV9yZWFkX3Vu
bG9jaygpOwogCi0JcmV0Y29kZSA9IGNvbm5fcmVxdWVzdF9zdGF0ZShjb25uZWN0aW9uLCBOUyhj
b25uLCBDX1VOQ09OTkVDVEVEKSwgQ1NfVkVSQk9TRSk7CisJcmV0Y29kZSA9IChlbnVtIGRyYmRf
cmV0X2NvZGUpY29ubl9yZXF1ZXN0X3N0YXRlKGNvbm5lY3Rpb24sCisJCQkJCU5TKGNvbm4sIENf
VU5DT05ORUNURUQpLCBDU19WRVJCT1NFKTsKIAogCWNvbm5fcmVjb25maWdfZG9uZShjb25uZWN0
aW9uKTsKIAltdXRleF91bmxvY2soJmFkbV9jdHgucmVzb3VyY2UtPmFkbV9tdXRleCk7CkBAIC0y
ODAwLDcgKzI4MDMsNyBAQCBpbnQgZHJiZF9hZG1fZGlzY29ubmVjdChzdHJ1Y3Qgc2tfYnVmZiAq
CiAJbXV0ZXhfbG9jaygmYWRtX2N0eC5yZXNvdXJjZS0+YWRtX211dGV4KTsKIAlydiA9IGNvbm5f
dHJ5X2Rpc2Nvbm5lY3QoY29ubmVjdGlvbiwgcGFybXMuZm9yY2VfZGlzY29ubmVjdCk7CiAJaWYg
KHJ2IDwgU1NfU1VDQ0VTUykKLQkJcmV0Y29kZSA9IHJ2OyAgLyogRklYTUU6IFR5cGUgbWlzbWF0
Y2guICovCisJCXJldGNvZGUgPSAoZW51bSBkcmJkX3JldF9jb2RlKXJ2OwogCWVsc2UKIAkJcmV0
Y29kZSA9IE5PX0VSUk9SOwogCW11dGV4X3VubG9jaygmYWRtX2N0eC5yZXNvdXJjZS0+YWRtX211
dGV4KTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmJkLWRldiBtYWlsaW5nIGxpc3QKZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpodHRwczovL2xp
c3RzLmxpbmJpdC5jb20vbWFpbG1hbi9saXN0aW5mby9kcmJkLWRldgo=
