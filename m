Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F593F6C5
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jul 2024 15:35:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D5F26420642;
	Mon, 29 Jul 2024 15:34:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6D0FF4203BF
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jul 2024 15:34:29 +0200 (CEST)
Received: by mail-wr1-f41.google.com with SMTP id
	ffacd0b85a97d-369c609d0c7so1904343f8f.3
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jul 2024 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1722260068; x=1722864868; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=vaTq8c97Q0YYm8v4QfyELIh8A06zqLDNH8RW/+dW7lQ=;
	b=INylrhD39PYXK0w19c8rNzJlz8JWYDUMzrIMx5UIkwoyVcUDLUwCjXbiTzF9mjM/8o
	16GkBkfWh1MN0Lx6GZPFNEM1dE2IIVrLsuT5WzlBTN3A5NArN9zgwHHUKKdZtYbF4yuV
	PKltgivmkKZFrqoYD6WUSLSjpV2WgBOm9DzLrTXyAF71NkF8V2TjkYCUCxsqxL9v4NGU
	dHolXeN+SZnYxXkrXmtPrd8lnTC8BG+/cxIUH1/q+xcmwfubKu2QHLC1ankUL9DZBER/
	V2wdmboiqWF90fRefHHoBm3BCqio969wnS6fLXJoP8ipCozzuV51HtOKBRde9I2eXZCp
	9q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1722260068; x=1722864868;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=vaTq8c97Q0YYm8v4QfyELIh8A06zqLDNH8RW/+dW7lQ=;
	b=mliTwSiz39bbcFS4ueBwrv05FzINmy4X4/nbRrvzq4YQM4Bv4+k6hZv66pjdcLffG2
	iJbZISu8vjLDNJruH2vdVY9aZXBNSQig5qiaA9NXB6XV8nQml42VGd8c8g/6ZQEpJfhe
	H7xNWd59u4muTfkHRddHtz+pTE6G9rbyMTvtf8vcdW2FqUAnN9qRTwVoi4/uh0uRLB82
	Ri51M4CiFQIQYnI8M7f6GjAVKdUaDv5CSC1/FfVN0x5AY88mjF1dtuBhEcA/B8isU+s/
	ubgY7dilXMnfz1koGGAtSUdHRBFDngPYCyPnE2dOKXGuPbIxkB6D43m+JlgULRKzHdSU
	5sQw==
X-Gm-Message-State: AOJu0YxYjvuCsSC9H4oPBWKN7ZAcOKfaIdpS4lUNdZ5WbzUkFrVcLRu4
	hEPxbjTyyqXQlbmjVb8iSOZEd/oLNH08iYE5hz+VWvA6aT/ZMx1rqtOl2bdB1d0ng1FMGTt1EaF
	K
X-Google-Smtp-Source: AGHT+IHMzduORDUiMmMhY+yEJMpXmiBFbsELuq4Rqc/cHLUrQXG+UC+ehJ7INiBTcA9PhTVGbeVz7Q==
X-Received: by 2002:a5d:6986:0:b0:368:4def:921a with SMTP id
	ffacd0b85a97d-36b5d0d10d3mr6384593f8f.48.1722260068264; 
	Mon, 29 Jul 2024 06:34:28 -0700 (PDT)
Received: from localhost.localdomain ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-70ead71832csm6802427b3a.72.2024.07.29.06.34.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 29 Jul 2024 06:34:27 -0700 (PDT)
From: Su Yue <glass.su@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [RFC PATCH 1/3] drbd.ocf: replace crm_master with ocf_promotion_score
Date: Mon, 29 Jul 2024 21:34:08 +0800
Message-ID: <20240729133410.8332-2-glass.su@suse.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729133410.8332-1-glass.su@suse.com>
References: <20240729133410.8332-1-glass.su@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lars.ellenberg@linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

The crm_master command has been deprecated and replaced with a new
crm_attribute --promotion option that defaults to --lifetime=reboot
(example: crm_master -l reboot -v 10 becomes
crm_attribute --promotion -v 10. The old command will still work for
now, but the new one should be used if available. The new option is
available as of CRM feature set 3.9.0).

Also define ocf_promotion_score() as
resource-agents/heartbeat/ocf-shellfuncs.in if it doesn't exist.

Signed-off-by: Su Yue <glass.su@suse.com>
---
 scripts/drbd.ocf | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/drbd.ocf b/scripts/drbd.ocf
index 1d051baa550d..133aff737455 100755
--- a/scripts/drbd.ocf
+++ b/scripts/drbd.ocf
@@ -104,6 +104,18 @@ if ! command -v ocf_is_true &> /dev/null ; then
 	}
 fi
 
+if ! command -v ocf_promotion_score &> /dev/null ; then
+	ocf_promotion_score() {
+		ocf_version_cmp "$OCF_RESKEY_crm_feature_set" "3.10.0"
+		res=$?
+		if [ $res -eq 2 ] || [ $res -eq 1 ] || ! have_binary "crm_master"; then
+			${HA_SBIN_DIR}/crm_attribute -p ${OCF_RESOURCE_INSTANCE} $@
+		else
+			${HA_SBIN_DIR}/crm_master -l reboot $@
+		fi
+	}
+fi
+
 # Defaults
 OCF_RESKEY_drbdconf_default="/etc/drbd.conf"
 OCF_RESKEY_unfence_extra_args_default="--quiet --flock-required --flock-timeout 0 --unfence-only-if-owner-match"
@@ -570,9 +582,9 @@ do_drbdadm() {
 unset current_master_score
 get_current_master_score()
 {
-	# only call crm_master once
+	# only call get crm master once
 	[[ ${current_master_score+set} ]] ||
-	current_master_score=$(crm_master -q -l reboot -G 2>/dev/null)
+	current_master_score=$(ocf_promotion_score -q -G 2>/dev/null)
 	# return value of this function:
 	# true if master_score is present
 	# false if master_score is not present
@@ -585,13 +597,13 @@ set_master_score() {
 	if [[ $1 -le 0 ]]; then
 		remove_master_score
 	else
-		do_cmd ${HA_SBIN_DIR}/crm_master -Q -l reboot -v $1 &&
+		do_cmd ocf_promotion_score -Q -v $1 &&
 		current_master_score=$1
 	fi
 }
 
 remove_master_score() {
-	do_cmd ${HA_SBIN_DIR}/crm_master -l reboot -D
+	do_cmd ocf_promotion_score -D
 	current_master_score=""
 }
 
-- 
2.45.2

