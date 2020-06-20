Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FA202100
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:35:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D0E1B42041B;
	Sat, 20 Jun 2020 05:35:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E16624203F6
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:25 +0200 (CEST)
Received: by mail-pl1-f196.google.com with SMTP id k1so4814622pls.2
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TsJU39le/9mzUUvkg/vEQ1ejtljvEC7MElEcoRxU/hs=;
	b=nLZb9q5MNXSO30mRLC8p+Z6tp7SeKI4c8mbyilFhnvlC39t+V3j0iQJ4vfU5EbJ/Ge
	yJs0yUXWykR2+lKlShzU2CG/atXeM++8u60h/nbziIo1McpvPT8URV5HcgXBrobq0ydJ
	LtCik9CXYKbYzZN1wG1+1XbNp5/sueNlWfLSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TsJU39le/9mzUUvkg/vEQ1ejtljvEC7MElEcoRxU/hs=;
	b=Jc68pROSBQMZ8cxvgz8WT9g9R07i5x8+YSQXSF0KWvNENExVsuwIjIAO9mSXcH3x5K
	GLtasA9ooMBOwvisciq9+rLlGCE/t0fuVV8ZWhuO3sSIEKMrTXweCQYFe1P1zGCVqeaA
	ot0B7NPhwQPAtciw90qYeu5JR5if0AXxcyFlaGIFL43cGqqiT6cX0bJlJb19YjfqIEVW
	pYxjJLKmWOQb9nE+d/HaHWbbSQOcd/ONRGerM4ZV0mdFRBn5FMwFRXrZ4DAqBCqD35F9
	rq8ihjPih39UmEm0PgAIBiWgW9CqCXvRJD5ekiOR1bUv7p3yLsS66vUoMjdb1+T0L1yG
	u5gw==
X-Gm-Message-State: AOAM530KqhINBPWbwhNi1LRRykesHpqmDA2iqNQqafXksaRcj+T/bBpd
	X8HUeTNfL/Wd7GgasDKa82Pr1Q==
X-Google-Smtp-Source: ABdhPJx/5DcfB27JAL/c3SFwGw95qhIKfr9dnkeTlJXy/0XzMHLMuVPklbRvet5f9iLDNbeJ3PiIXQ==
X-Received: by 2002:a17:902:8f83:: with SMTP id
	z3mr10333002plo.203.1592623824777; 
	Fri, 19 Jun 2020 20:30:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	ev20sm6238855pjb.8.2020.06.19.20.30.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:30:01 -0700
Message-Id: <20200620033007.1444705-11-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	clang-built-linux@googlegroups.com, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 10/16] KVM: PPC: Book3S PR: Remove
	uninitialized_var() usage
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Using uninitialized_var() is dangerous as it papers over real bugs[1]
(or can in the future), and suppresses unrelated compiler warnings (e.g.
"unused variable"). If the compiler thinks it is uninitialized, either
simply initialize the variable or make compiler changes. As a precursor
to removing[2] this[3] macro[4], just remove this variable since it was
actually unused:

arch/powerpc/kvm/book3s_pr.c:1832:16: warning: unused variable 'vrsave' [-Wunused-variable]
        unsigned long vrsave;
                      ^

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Fixes: f05ed4d56e9c ("KVM: PPC: Split out code from book3s.c into book3s_pr.c")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kvm/book3s_pr.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index ef54f917bdaf..ed12dfbf9bb5 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1828,9 +1828,6 @@ static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 {
 	struct kvm_run *run = vcpu->run;
 	int ret;
-#ifdef CONFIG_ALTIVEC
-	unsigned long uninitialized_var(vrsave);
-#endif
 
 	/* Check if we can run the vcpu at all */
 	if (!vcpu->arch.sane) {
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
